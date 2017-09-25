import { connect } from 'react-redux';
import { withRouter } from 'react-router-dom';

import CommentForm from './comment_form';

import {
  createComment,
  updateComment,
  fetchComments
} from '../../actions/comment_actions';

const mapStateToProps = (state, ownProps) => {
  const { currentUser } = state.session;
  let comment = {
    body: '',
    project_id: parseInt(ownProps.match.params.projectId),
    author_id: currentUser ? currentUser.id : -1
  };

  return {
    comment,
    currentUser
  };
};

const mapDispatchToProps = dispatch => ({
  fetchComments: projectId => dispatch(fetchComments(projectId)),
  createComment: id => dispatch(createComment(id)),
  updateComment: comment => dispatch(updateComment(comment))
});

export default withRouter(
  connect(mapStateToProps, mapDispatchToProps)(CommentForm)
);
