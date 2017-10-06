import { connect } from 'react-redux';
import { withRouter } from 'react-router-dom';

import ProjectForm from './project_form';

import {
  fetchProject,
  createProjectOption,
  updateProjectOption
} from '../../actions/project_actions';

const mapStateToProps = (state, ownProps) => {
  let project = {
    title: '',
    description: '',
    imageFile: null,
    video_url: '',
    tags: [],
    author_id: state.session.currentUser.id
  };
  let formType = 'new';

  if (ownProps.match.path === '/projects/:projectId/edit') {
    project = state.entities.projects[ownProps.match.params.projectId];
    formType = 'edit';
  }

  const errors = state.errors.session;

  if (project && project.tags.length === 0) {
    project.tags = ['Other'];
  }

  return {
    project,
    formType,
    errors,
    currentUser: state.session.currentUser
  };
};

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    fetchProject: id => dispatch(fetchProject(id)),
    createProjectOption: formData => dispatch(createProjectOption(formData)),
    updateProjectOption: (formData, id) =>
      dispatch(updateProjectOption(formData, id))
  };
};

export default withRouter(
  connect(mapStateToProps, mapDispatchToProps)(ProjectForm)
);
