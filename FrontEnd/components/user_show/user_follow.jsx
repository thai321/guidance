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
    const hideFollowee = followeeUsers.length === 0 ? 'none' : '';

    return (
      <div className="user-follow-index">
        {followeeUsers.length === 0 ? (
          ''
        ) : (
          <div className="user-follow-following">
            <h2>{followeeUsers.length} Following</h2>
            <div className="row">
              {this.displayFollow(followeeUsers, 'follower')}
            </div>
          </div>
        )}

        {followerUsers.length === 0 ? (
          ''
        ) : (
          <div className="user-follow-follower">
            <h2>{followerUsers.length} Followers</h2>
            <div className="row">
              {this.displayFollow(followerUsers, 'followers')}
            </div>
          </div>
        )}
      </div>
    );
  }
}

export default UserFollow;
