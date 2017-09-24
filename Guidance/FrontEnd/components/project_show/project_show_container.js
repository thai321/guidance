import { connect } from 'react-redux';

import ProjectShow from './project_show';

import { fetchProject } from '../../actions/project_actions';
import { fetchUser } from '../../actions/user_actions';
import { fetchSteps } from '../../actions/step_actions';

const mapStateToProps = (state, ownProps) => {
  const project = state.entities.projects[ownProps.match.params.projectId];

  const steps = Object.values(state.entities.steps);

  return {
    project,
    steps,
    currentUser: state.session.currentUser
  };
};

const mapDispatchToProps = dispatch => ({
  fetchProject: id => dispatch(fetchProject(id)),
  fetchUser: id => dispatch(fetchUser(id)),
  fetchSteps: projectId => dispatch(fetchSteps(projectId))
});

export default connect(mapStateToProps, mapDispatchToProps)(ProjectShow);
