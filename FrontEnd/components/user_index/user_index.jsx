import React from 'react';

import UserIndexItem from './user_index_item';

import { uniqueId } from '../../util/id_generator';

class UserIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchUsers();
  }

  render() {
    if (!this.props.users) {
      return (
        <div>
          <h1>Loading...</h1>
        </div>
      );
    }

    return (
      <div className="project-index">
        <div className="container-fluid">
          <div className="row">
            {this.props.userIds.map(id => {
              const user = this.props.users[id];

              return (
                <UserIndexItem key={user.id + id + uniqueId()} user={user} />
              );
            })}
          </div>
        </div>
      </div>
    );
  }
}

export default UserIndex;
