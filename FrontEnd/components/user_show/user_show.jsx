import React from 'react';
import { Link } from 'react-router-dom';

import { uniqueId } from '../../util/id_generator';

import ProjectIndexItem from '../project_index/project_index_item';
import FavoriteShowContainer from '../favorite_show/favorite_show_container';

class UserShow extends React.Component {
  constructor(props) {
    super(props);

    this.state = this.props.currentUser;
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateFile = this.updateFile.bind(this);
    this.toggleFollow = this.toggleFollow.bind(this);
  }

  componentDidMount() {
    const { currentUser } = this.props;
    const { userId } = this.props.match.params;

    let filter = true;
    if (currentUser && currentUser.id == userId) {
      filter = false;
    }

    this.props.fetchUser(this.props.match.params.userId).then(action => {
      const hash = { userId: action.user.id, filter };
      this.setState(action.user);
      this.props.fetchProjects(action.user.id, filter).then(() => {
        this.props.fetchFavoriteProjects(action.user.favorite_projects);
      });
    });
  }

  componentWillReceiveProps(nextProps) {
    const { currentUser } = this.props;
    const { userId } = nextProps.match.params;

    let filter = true;
    if (currentUser && currentUser.id == userId) {
      filter = false;
      this.setState(currentUser);
    }

    if (this.props.match.params.userId !== nextProps.match.params.userId) {
      this.props.fetchUser(nextProps.match.params.userId).then(action => {
        this.setState(action.user);
        const hash = { userId: action.user.id, filter };
        this.props.fetchProjects(action.user.id, filter);
      });
    }
  }

  handleSubmit(e) {
    e.preventDefault();
    const { currentUser } = this.props;

    const formData = new FormData();
    formData.append('user[id]', currentUser.id);
    formData.append('user[username]', currentUser.username);
    formData.append('user[email]', currentUser.email);

    if (this.state.imageFile) {
      formData.append('user[image]', this.state.imageFile);
      this.props
        .updateUserOption(formData, currentUser.id)
        .then(action => this.props.history.push(`/users/${action.user.id}`));
    }
  }

  updateFile(e) {
    e.preventDefault();
    const file = e.currentTarget.files[0];
    const fileReader = new FileReader();

    fileReader.onloadend = () => {
      this.setState({ imageFile: file, image_url: fileReader.result });
    };

    if (file) {
      fileReader.readAsDataURL(file);
    }
  }

  displayFavorite() {
    const { currentUser, user } = this.props;
    if (user.favorite_projects.length > 0) {
      return <div>{user.favorite_projects.length} favorite projects</div>;
    }
  }

  displayProjects(type) {
    const projects =
      type === 'Published'
        ? this.props.projectsByUser
        : this.props.unPublishedProjects;

    if (projects.length > 0) {
      return (
        <div className="row">
          {projects.map(project => {
            return (
              <ProjectIndexItem
                key={
                  project.id + project.title + this.props.user.id + uniqueId()
                }
                project={project}
                currentUser={this.props.currentUser}
              />
            );
          })}
        </div>
      );
    }
  }

  isFollowed() {
    let followText = 'Follow';
    const { user, currentUser } = this.props;

    if (currentUser) {
      const userFollowers = user.followers;

      if (userFollowers.indexOf(currentUser.id) !== -1) {
        followText = 'UnFollow';
      }
    }

    return followText;
  }

  toggleFollow() {
    const { currentUser, user } = this.props;
    let follow;
    if (currentUser.id === -1) {
      this.props.createFollow(follow);
    } else {
      follow = { follower_id: currentUser.id, followee_id: user.id };
      if (this.isFollowed() === 'Follow') {
        this.props.createFollow(follow);
      } else {
        this.props.deteleFollow(follow);
      }
    }
  }

  render() {
    if (!this.props.user) {
      return <div className="loader" />;
    } else {
      const { user, projectsByUser, unPublishedProjects } = this.props;

      const publishText =
        projectsByUser.length > 0
          ? `${projectsByUser.length} Published Projects`
          : '';

      const UnpublishText =
        unPublishedProjects.length > 0
          ? `${unPublishedProjects.length} Un-Published Projects`
          : '';

      const displayUpload = () => {
        const { currentUser } = this.props;
        if (currentUser && currentUser.id === user.id) {
          return (
            <div>
              <form>
                <input
                  type="file"
                  placeholder="Upload Your image"
                  onChange={this.updateFile}
                />

                <input type="submit" onClick={this.handleSubmit} />
              </form>
            </div>
          );
        }
      };

      const displayFollow = () => {
        return <button onClick={this.toggleFollow}>{this.isFollowed()}</button>;
      };

      return (
        <div className="user-show-projects">
          <div className="container-fluid">
            <div className="user-index-info">
              <div className="card">
                <div className="user-index-item-image">
                  <img className="card-img-top" src={user.image_url} />
                </div>
                <div className="card-block card-user-title">
                  <h4 className="card-title">{user.username}</h4>
                  {displayFollow()}
                </div>
              </div>
            </div>

            {displayUpload()}

            <div className="project-text-user-show">
              <h2>{publishText}</h2>
            </div>

            {this.displayProjects('Published')}

            <div className="project-text-user-show">
              <h2>{UnpublishText}</h2>
            </div>

            {this.displayProjects('UnPublished')}

            <div className="project-text-user-show">
              <h2>{this.displayFavorite()}</h2>
            </div>

            <FavoriteShowContainer user={user} />
          </div>
        </div>
      );
    }
  }
}

export default UserShow;
