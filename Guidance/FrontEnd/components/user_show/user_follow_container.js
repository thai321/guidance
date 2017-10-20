import { connect } from 'react-redux';

import UserFollow from './user_follow';

import { fetchFollowers, fetchFollowees } from '../../actions/user_actions';

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
    followeeUsers,
    Element: ownProps.Element
  };
};

const mapDispatchToProps = dispatch => {
  return {
    fetchFollowers: id => dispatch(fetchFollowers(id)),
    fetchFollowees: id => dispatch(fetchFollowees(id))
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(UserFollow);
