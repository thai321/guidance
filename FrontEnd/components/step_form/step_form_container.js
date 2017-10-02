import { connect } from 'react-redux';
import { withRouter } from 'react-router-dom';

import { fetchStep, createStep, updateStep } from '../../actions/step_actions';

import { fetchProject } from '../../actions/project_actions';

import StepForm from './step_form';

const mapStateToProps = (state, ownProps) => {
  const projectId = parseInt(ownProps.match.params.projectId);

  let step = {
    title: '',
    body: '',
    project_id: projectId
  };

  let idx = null;

  if (ownProps.match.path == '/projects/:projectId/steps/:stepId/edit') {
    const stepId = parseInt(ownProps.match.params.stepId);
    step = state.entities.steps[stepId];

    const project = state.entities.projects[projectId];
    if (project) {
      const steps = project.step_ids.sort((a, b) => a.id - b.id);
      idx = steps.indexOf(stepId) + 1;
    }
  }

  return { step, currentUser: state.session.currentUser, idx };
};

const mapDispatchToProps = (dispatch, ownProps) => {
  let formType = 'new';
  let action = createStep;
  if (ownProps.match.path == '/projects/:projectId/steps/:stepId/edit') {
    formType = 'edit';
    action = updateStep;
  }

  return {
    fetchStep: id => dispatch(fetchStep(id)),
    fetchProject: project_id => dispatch(fetchProject(project_id)),
    action: step => dispatch(action(step)),
    formType
  };
};

export default withRouter(
  connect(mapStateToProps, mapDispatchToProps)(StepForm)
);
