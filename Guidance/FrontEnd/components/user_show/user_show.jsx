import React from 'react';
import { Link } from 'react-router-dom';

// import { projectByIds } from '../../reducers/selectors';

import ProjectIndexItem from '../project_index/project_index_item';

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

      return (
        <div className="project-index">
          <div className="container-fluid">
            <h1>{user.username}</h1>
            <img src={user.image_url} />
            <div className="row">
              {this.props.projectsByUser.map(project => (
                <ProjectIndexItem project={project} />
              ))}
            </div>
          </div>
        </div>
      );
    }
  }
}

export default UserShow;
