import { connect } from 'react-redux';
import { withRouter } from 'react-router-dom';

import { fetchUser } from '../../actions/user_actions';
import { fetchProjects } from '../../actions/project_actions';

import UserShow from './user_show';

const mapStateToProps = (state, ownProps) => {
  const { userId } = ownProps.match.params;
  const user = state.entities.users[userId];
  const { currentUser } = state.session;

  const projects = state.entities.projects;
  // debugger;
  let projectIds = [];
  let projectsByUser = [];
  if (user && Object.keys(projects).length > 1) {
    if (currentUser && currentUser.id == userId) {
      projectsByUser = Object.values(projects);
    } else {
      projectIds = user.project_ids;

      projectIds.forEach(id => {
        const project = projects[id];
        if (project) projectsByUser.push(project);
      });
    }
  }

  return {
    user,
    currentUser,
    projectsByUser
  };
};

const mapDispatchToProps = dispatch => {
  return {
    fetchUser: id => dispatch(fetchUser(id)),
    fetchProjects: (userId, filter) => dispatch(fetchProjects(userId, filter))
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(UserShow);
