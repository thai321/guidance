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
      <div className="col col-md-3 col-xs-12">
        <div className="thumbnail">
          <img className="img-thumbnail" src={image_url} />
          <span className="project-index-title">{username}</span>
          <h6>Published projects: {project_ids.length}</h6>
          <h6>followers: {followers.length}</h6>
          <h6>following: {followees.length}</h6>
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
