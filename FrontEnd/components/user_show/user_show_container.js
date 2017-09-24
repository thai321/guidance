import { connect } from 'react-redux';
import { withRouter } from 'react-router-dom';

import { fetchUser } from '../../actions/user_actions';
import { fetchProjects } from '../../actions/project_actions';

import UserShow from './user_show';

const mapStateToProps = (state, ownProps) => {
  const userId = ownProps.match.params.userId;
  const user = state.entities.users[userId];
  const projects = state.entities.projects;

  let projectIds = [];
  let projectsByUser = [];

  if (user && Object.keys(projects).length > 1) {
    projectIds = user.project_ids;

    projectIds.forEach(id => {
      const project = projects[id];
      if (project) projectsByUser.push(project);
    });
  }

  return {
    user,
    currentUser: state.session.currentUser,
    projectsByUser
  };
};

const mapDispatchToProps = dispatch => {
  return {
    fetchUser: id => dispatch(fetchUser(id)),
    fetchProjects: userId => dispatch(fetchProjects(userId))
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(UserShow);
