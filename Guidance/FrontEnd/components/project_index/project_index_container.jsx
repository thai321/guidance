import { connect } from 'react-redux';

import { fetchProject, fetchProjects } from '../../actions/project_actions';

import ProjectIndex from './project_index';

const mapStateToProps = state => {
  const projects = [];

  Object.values(state.entities.projects)
    .reverse()
    .forEach(project => {
      if (project.id) {
        projects.push(project);
      }
    });

  return {
    currentUser: state.session.currentUser,
    projects
  };
};

const mapDispatchToProps = dispatch => {
  return {
    fetchProjects: () => dispatch(fetchProjects()),
    fetchProject: id => dispatch(fetchProjects(id))
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(ProjectIndex);
