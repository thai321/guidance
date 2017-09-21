import { connect } from 'react-redux';
import { withRouter } from 'react-router-dom';

import ProjectForm from './project_form';

import {
  createProject,
  updateProject,
  fetchProject
} from '../../actions/project_actions';

const mapStateToProps = (state, ownProps) => {
  let project = {
    title: '',
    description: '',
    // image_url: '',
    video_url: '',
    author_id: state.session.currentUser.id
  };
  // debugger;
  let formType = 'new';

  if (ownProps.match.path === '/projects/:projectId/edit') {
    project = state.entities.projects[ownProps.match.params.projectId];
    formType = 'edit';
  }

  return { project, formType };
};

const mapDispatchToProps = (dispatch, ownProps) => {
  // debugger;
  let action =
    ownProps.match.path === '/projects/new' ? createProject : updateProject;

  return {
    fetchProject: id => dispatch(fetchProject(id)),
    action: project => dispatch(action(project))
  };
};

export default withRouter(
  connect(mapStateToProps, mapDispatchToProps)(ProjectForm)
);
