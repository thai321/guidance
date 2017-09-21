import React from 'react';
import { Link, withRouter } from 'react-router-dom';

class UserIndexItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { username } = this.props.user;
    const numProjects = this.props.user.project_ids.length;
    return (
      <div>
        <h1>{username}</h1>
        <h2>#Projects: {numProjects}</h2>
      </div>
    );
  }
}

export default UserIndexItem;
