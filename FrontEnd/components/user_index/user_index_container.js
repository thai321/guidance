import { connect } from 'react-redux';

import { fetchUser, fetchUsers } from '../../actions/user_actions';

import { fetchProject, fetchProjects } from '../../actions/project_actions';

import UserIndex from './user_index';

const mapStateToProps = state => {
  const users = [];
  const userIds = Object.values(state.entities.users.allIds);

  userIds.forEach(id => {
    users.push(state.entities.users[id]);
  });

  return {
    users
  };
};

const mapDispatchToProps = dispatch => {
  return {
    fetchUsers: () => dispatch(fetchUsers()),
    fetchUser: id => dispatch(fetchUser(id))
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(UserIndex);
