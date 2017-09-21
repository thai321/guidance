import React from 'react';

import UserIndexItem from './user_index_item';

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
      <div>
        {this.props.userIds.map(id => {
          const user = this.props.users[id];

          return <UserIndexItem key={user.email} user={user} />;
        })}
      </div>
    );
  }
}

export default UserIndex;
