import { connect } from 'react-redux';

import { fetchTagProjects } from '../../actions/project_actions';

import ProjectTag from './project_tag';

const mapStateToProps = (state, ownProps) => {
  debugger;
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
    // tagName
    projects
  };
};

const mapDispatchToProps = dispatch => {
  return {
    fetchTagProjects: name => dispatch(fetchTagProjects(name))
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(ProjectTag);
