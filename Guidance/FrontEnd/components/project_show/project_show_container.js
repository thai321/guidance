import { connect } from 'react-redux';

import ProjectShow from './project_show';

import { fetchProject, updateProject } from '../../actions/project_actions';
import { fetchUser } from '../../actions/user_actions';
import { fetchSteps, removeStep } from '../../actions/step_actions';
import { createFavorite, deleteFavorite } from '../../actions/favorite_actions';

import {
  createComment,
  updateComment,
  fetchComments
} from '../../actions/comment_actions';

const mapStateToProps = (state, ownProps) => {
  const { projectId } = ownProps.match.params;
  const project = state.entities.projects[projectId];

  const stepObj = {};
  const steps = Object.values(state.entities.steps).forEach(step => {
    if (step.project_id === parseInt(projectId)) {
      stepObj[step.id] = step;
    }
  });

  return {
    project,
    steps: Object.values(stepObj).sort((a, b) => a.id - b.id),
    currentUser: state.session.currentUser
  };
};

const mapDispatchToProps = dispatch => ({
  fetchProject: id => dispatch(fetchProject(id)),
  fetchUser: id => dispatch(fetchUser(id)),
  fetchSteps: projectId => dispatch(fetchSteps(projectId)),
  removeStep: stepId => dispatch(removeStep(stepId)),
  updateProject: project => dispatch(updateProject(project)),
  fetchComments: projectId => dispatch(fetchComments(projectId)),
  createFavorite: favorite => dispatch(createFavorite(favorite)),
  deleteFavorite: favorite => dispatch(deleteFavorite(favorite))
});

export default connect(mapStateToProps, mapDispatchToProps)(ProjectShow);
