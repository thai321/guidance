import { connect } from 'react-redux';
import { withRouter } from 'react-router-dom';

import { fetchUser, updateUserOption } from '../../actions/user_actions';
import { fetchFollowers, fetchFollowees } from '../../actions/user_actions';
import {
  fetchProjects,
  fetchFavoriteProjects
} from '../../actions/project_actions';

import { createFollow, deteleFollow } from '../../actions/follow_actions';

import UserShow from './user_show';

const mapStateToProps = (state, ownProps) => {
  const { userId } = ownProps.match.params;
  const user = state.entities.users[userId];
  let currentUser = {
    id: -1,
    username: '',
    imageFile: null
  };

  if (state.session.currentUser) currentUser = state.session.currentUser;

  const projects = state.entities.projects;
  let projectsByUser = [];

  let unPublishedProjects = [];

  if (user && Object.keys(projects).length > 1) {
    if (currentUser && currentUser.id == userId) {
      Object.values(projects).forEach(project => {
        if (project.id && project.author_id === currentUser.id) {
          if (!project.published) {
            unPublishedProjects.push(project);
          } else {
            projectsByUser.push(project);
          }
        }
      });
    } else {
      user.project_ids.forEach(id => {
        const project = projects[id];
        if (project) projectsByUser.push(project);
      });
    }
  }

  const followerUsers = [];
  const followeeUsers = [];

  if (user) {
    const followers = user.followers;
    const followees = user.followees;

    followers.forEach(id => {
      const usr = state.entities.users[id];
      if (usr) {
        followerUsers.push(usr);
      }
    });

    followees.forEach(id => {
      const usr = state.entities.users[id];
      if (usr) {
        followeeUsers.push(usr);
      }
    });
  }

  return {
    user,
    currentUser,
    unPublishedProjects,
    projectsByUser,
    followerUsers,
    followeeUsers
  };
};

const mapDispatchToProps = dispatch => {
  return {
    fetchUser: id => dispatch(fetchUser(id)),
    updateUserOption: (formData, id) =>
      dispatch(updateUserOption(formData, id)),
    fetchProjects: (userId, filter) => dispatch(fetchProjects(userId, filter)),
    fetchFavoriteProjects: projectIds =>
      dispatch(fetchFavoriteProjects(projectIds)),
    createFollow: (followeeId, followerId) =>
      dispatch(createFollow(followeeId, followerId)),
    deteleFollow: (followeeId, followerId) =>
      dispatch(deteleFollow(followeeId, followerId)),
    fetchFollowers: id => dispatch(fetchFollowers(id)),
    fetchFollowees: id => dispatch(fetchFollowees(id))
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(UserShow);
