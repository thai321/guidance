import React from 'react';
import { Link } from 'react-router-dom';

// import { projectByIds } from '../../reducers/selectors';
import { uniqueId } from '../../util/id_generator';

import ProjectIndexItem from '../project_index/project_index_item';
import FavoriteShowContainer from '../favorite_show/favorite_show_container';

class UserShow extends React.Component {
  constructor(props) {
    super(props);
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
    }

    if (this.props.match.params.userId !== nextProps.match.params.userId) {
      this.props.fetchUser(nextProps.match.params.userId).then(action => {
        const hash = { userId: action.user.id, filter };
        this.props.fetchProjects(action.user.id, filter);
      });
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
