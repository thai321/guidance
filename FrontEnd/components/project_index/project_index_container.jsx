import { connect } from 'react-redux';

import { fetchProject, fetchProjects } from '../../actions/project_actions';

import ProjectIndex from './project_index';

const mapStateToProps = state => {
  const projects = [];

  const projectIds = Object.values(state.entities.projects.allIds);

  projectIds.forEach(id => {
    projects.push(state.entities.projects[id]);
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
