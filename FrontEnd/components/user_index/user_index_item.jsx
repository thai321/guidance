import React from 'react';
import { Link, withRouter } from 'react-router-dom';

class UserIndexItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { id, username } = this.props.user;
    const numProjects = this.props.user.project_ids.length;
    return (
      <div className="col col-md-3">
        <div className="thumbnail">
          <Link className="btn btn-info btn-sm btn-block" to={`/users/${id}`}>
            User Information
          </Link>
          <img
            alt="Bootstrap Thumbnail First"
            src="http://lorempixel.com/output/people-q-c-600-200-1.jpg"
          />
          <div className="caption">
            <h4>
              {username} #Projects: {numProjects}
            </h4>
          </div>
        </div>
      </div>
    );
  }
}

export default UserIndexItem;
