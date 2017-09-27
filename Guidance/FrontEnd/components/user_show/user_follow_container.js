import { connect } from 'react-redux';

import UserFollow from './user_follow';

const mapStateToProps = (state, ownProps) => {
  const { user } = ownProps;

  const followers = user.followers;
  const followees = user.followees;

  const followerUsers = [];
  followers.forEach(id => {
    const usr = state.entities.users[id];
    if (usr) {
      followerUsers.push(usr);
    }
  });

  const followeeUsers = [];
  followees.forEach(id => {
    const usr = state.entities.users[id];
    if (usr) {
      followeeUsers.push(usr);
    }
  });

  return {
    followerUsers,
    followeeUsers
  };
};

export default connect(mapStateToProps, null)(UserFollow);
