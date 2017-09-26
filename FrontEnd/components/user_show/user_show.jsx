import React from 'react';
import { Link } from 'react-router-dom';

// import { projectByIds } from '../../reducers/selectors';
import { uniqueId } from '../../util/id_generator';

import ProjectIndexItem from '../project_index/project_index_item';
import FavoriteShowContainer from '../favorite_show/favorite_show_container';

class UserShow extends React.Component {
  constructor(props) {
    super(props);

    this.state = this.props.currentUser;
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateFile = this.updateFile.bind(this);
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
    // debugger;
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
    if (currentUser && user.id == currentUser.id) {
      return (
        <div>
          <h4>{currentUser.favorite_projects.length} favorite projects</h4>
        </div>
      );
    }
  }

  render() {
    if (!this.props.user) {
      return <div className="loader" />;
    } else {
      const { user } = this.props;
      const text = user.project_ids.length > 0 ? 'Projects' : '';

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

      return (
        <div className="project-index">
          <div className="container-fluid">
            <div className="user-index-info">
              <div className="card">
                <div className="user-index-item-image">
                  <img className="card-img-top" src={user.image_url} />
                </div>
                <div className="card-block card-user-title">
                  <h4 className="card-title">
                    {user.username} has {user.project_ids.length} published
                    projects
                  </h4>
                  {this.displayFavorite()}
                </div>
              </div>
            </div>

            {displayUpload()}

            <div className="project-text-user-show">
              <h2>{text}</h2>
            </div>

            <div className="row">
              <br />
              {this.props.projectsByUser.map(project => {
                return (
                  <ProjectIndexItem
                    key={project.id + project.title + user.id + uniqueId()}
                    project={project}
                    currentUser={this.props.currentUser}
                  />
                );
              })}
            </div>
          </div>

          <FavoriteShowContainer user={user} />
        </div>
      );
    }
  }
}

export default UserShow;
