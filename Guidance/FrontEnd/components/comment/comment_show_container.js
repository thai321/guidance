import { connect } from 'react-redux';
import { withRouter } from 'react-router-dom';

import CommentShow from './comment_show';

import { fetchComments } from '../../actions/comment_actions';

const mapStateToProps = (state, ownProps) => {
  const comments = Object.values(state.entities.comments).reverse();
  const project =
    state.entities.projects[parseInt(ownProps.match.params.projectId)];

  return {
    comments,
    project,
    currentUser: state.session.currentUser
  };
};

const mapDispatchToProps = dispatch => ({
  fetchComments: projectId => dispatch(fetchComments(projectId))
});

export default withRouter(
  connect(mapStateToProps, mapDispatchToProps)(CommentShow)
);
