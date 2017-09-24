import React from 'react';
import { Link, withRouter } from 'react-router-dom';

class UserIndexItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { id, username, image_url, project_ids } = this.props.user;
    const numProjects = this.props.user.project_ids.length;
    return (
      <div className="user-index-item">
        <div className="card">
          <Link className="btn btn-info btn-sm btn-block" to={`/users/${id}`}>
            User Information
          </Link>
          <div className="user-index-item-image">
            <img className="card-img-top" alt="No User Photo" src={image_url} />
          </div>

          <div className="user-index-info">
            <div className="card-block card-user-title">
              <h7 className="card-title">
                {username} has
                {project_ids.length} published projects
              </h7>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default UserIndexItem;
