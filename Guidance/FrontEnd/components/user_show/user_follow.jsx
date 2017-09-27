import React from 'react';

import { uniqueId } from '../../util/id_generator';

import UserIndexItem from '../user_index/user_index_item';

class UserFollow extends React.Component {
  constructor(props) {
    super(props);
  }

  displayFollow(users, type) {
    return users.map((user, idx) => {
      return (
        <UserIndexItem
          key={user.id + user.username + idx + uniqueId()}
          user={user}
        />
      );
    });
  }

  render() {
    const { followeeUsers, followerUsers } = this.props;

    return (
      <div className="user-follow-index">
        <div className="user-follow-following">
          <h1>{followeeUsers.length} Following</h1>
          <div className="row">
            {this.displayFollow(followeeUsers, 'follower')}
          </div>
        </div>

        <div className="user-follow-follower">
          <h1>{followerUsers.length} Followers</h1>
          <div className="row">
            {this.displayFollow(followerUsers, 'followers')}
          </div>
        </div>
      </div>
    );
  }
}

export default UserFollow;
