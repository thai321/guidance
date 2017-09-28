import React from 'react';
import { Link, withRouter } from 'react-router-dom';

class UserIndexItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const {
      id,
      username,
      image_url,
      project_ids,
      followers,
      followees
    } = this.props.user;
    const numProjects = this.props.user.project_ids.length;
    return (
      <div className="col-lg-3 col-md-4 col-xs-6">
        <div className="d-block mb-4 h-100">
          <div className="image-border">
            <div className="image-frame-responsive">
              <img className="img-fluid img-thumbnail" src={image_url} />
            </div>
          </div>
          <span className="user-index-item-username">{username}</span>
          <div className="user-index-item-project-info">
            <span>Published projects: {project_ids.length}</span>
            <span>Followers: {followers.length}</span>
            <span>Following: {followees.length}</span>
          </div>
          <p>
            <Link className="btn btn-info btn-block" to={`/users/${id}`}>
              User Information
            </Link>
          </p>
        </div>
      </div>
    );
  }
}

export default UserIndexItem;
