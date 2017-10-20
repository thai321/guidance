import React from 'react';
import { withRouter } from 'react-router-dom';

import { uniqueId } from '../../util/id_generator';

import UserIndexItem from '../user_index/user_index_item';

class UserFollow extends React.Component {
  componentDidMount() {
    this.props.fetchFollowers(this.props.user.id);
    this.props.fetchFollowees(this.props.user.id);
  }

  componentWillReceiveProps(nextProps) {
    const { userId } = this.props.match.params;
    const nextId = nextProps.match.params.userId;

    if (userId !== nextId) {
      this.props.fetchFollowers(nextId);
      this.props.fetchFollowees(nextId);
    }
  }

  displayFollowUsers(users, type) {
    if (!users) return;

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
    if (!this.props.user) {
      return <div className="loader" />;
    } else {
      const { followeeUsers, followerUsers } = this.props;
      const hideFollowee =
        followeeUsers && followeeUsers.length === 0 ? 'none' : '';

      return (
        <div className="user-follow-index">
          {followeeUsers && followeeUsers.length === 0 ? (
            ''
          ) : (
            <div className="user-follow-following">
              <Element name="following" />
              <h2>{followeeUsers && followeeUsers.length} Following</h2>
              <div className="row">
                {this.displayFollowUsers(followeeUsers, 'follower')}
              </div>
            </div>
          )}

          {followerUsers && followerUsers.length === 0 ? (
            ''
          ) : (
            <div className="user-follow-follower">
              <Element name="follower" />
              <h2>{followerUsers && followerUsers.length} Followers</h2>
              <div className="row">
                {this.displayFollowUsers(followerUsers, 'followers')}
              </div>
            </div>
          )}
        </div>
      );
    }
  }
}

export default withRouter(UserFollow);
