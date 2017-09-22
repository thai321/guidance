import { connect } from 'react-redux';
import ProjectShow from './project_show';
import { fetchProject } from '../../actions/project_actions';

import { fetchUser } from '../../actions/user_actions';

const mapStateToProps = (state, ownProps) => {
  const project = state.entities.projects[ownProps.match.params.projectId];
  // debugger;
  // const user = state.entities.users[project.author_id];
  return {
    project
  };
};

const mapDispatchToProps = dispatch => ({
  fetchProject: id => dispatch(fetchProject(id)),
  fetchUser: id => dispatch(fetchUser(id))
});

export default connect(mapStateToProps, mapDispatchToProps)(ProjectShow);
