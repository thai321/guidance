import React from 'react';
import { Link } from 'react-router-dom';

// import { projectByIds } from '../../reducers/selectors';

import ProjectIndexItem from '../project_index/project_index_item';

import { uniqueId } from '../../util/id_generator';

class UserShow extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props
      .fetchUser(this.props.match.params.userId)
      .then(this.props.fetchProjects());
  }

  render() {
    if (!this.props.user) {
      return (
        <div>
          <h1>Loading...</h1>
        </div>
      );
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
                    {user.username} has {user.project_ids.length} projects
                  </h4>
                </div>
              </div>
            </div>

            <div className="project-text-user-show">
              <h2>{text}</h2>
            </div>

            <div className="row">
              <br />
              {this.props.projectsByUser.map(project => (
                <ProjectIndexItem
                  key={project.title + user.id + uniqueId()}
                  project={project}
                  currentUser={this.props.currentUser}
                />
              ))}
            </div>
          </div>
        </div>
      );
    }
  }
}

export default UserShow;
