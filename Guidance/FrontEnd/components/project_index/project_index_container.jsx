import { connect } from 'react-redux';

import { fetchProject, fetchProjects } from '../../actions/project_actions';

import ProjectIndex from './project_index';

const mapStateToProps = state => {
  return {
    projectIds: Object.values(state.entities.projects.allIds),
    projects: state.entities.projects
  };
};

const mapDispatchToProps = dispatch => {
  return {
    fetchProjects: () => dispatch(fetchProjects()),
    fetchProject: id => dispatch(fetchProjects(id))
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(ProjectIndex);
