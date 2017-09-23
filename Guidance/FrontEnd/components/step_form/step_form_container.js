import { connect } from 'react-redux';
import { withRouter } from 'react-router-dom';

import { fetchSteps, createStep, updateStep } from '../../actions/step_actions';

import { fetchProject } from '../../actions/project_actions';

import StepForm from './step_form';

const mapStateToProps = (state, ownProps) => {
  // debugger;
  let step = {
    title: '',
    body: '',
    project_id: parseInt(ownProps.match.params.projectId)
  };

  if (ownProps.match.path == '/projects/:projectId/steps/:stepId/edit') {
    const stepId = parseInt(ownProps.match.params.stepId);
    step = state.entities.steps[stepId];
  }

  return { step };
};

const mapDispatchToProps = (dispatch, ownProps) => {
  // debugger;
  let formType = 'new';
  let action = createStep;
  if (ownProps.match.path == '/projects/:projectId/steps/:stepId/edit') {
    formType = 'edit';
    action = updateStep;
  }

  return {
    fetchSteps: project_id => dispatch(fetchSteps(project_id)),
    fetchProject: project_id => dispatch(fetchProject(project_id)),
    action: step => dispatch(action(step)),
    formType
  };
};

export default withRouter(
  connect(mapStateToProps, mapDispatchToProps)(StepForm)
);
