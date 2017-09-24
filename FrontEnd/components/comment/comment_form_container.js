import { connect } from 'react-redux';
import { withRouter } from 'react-router-dom';

import CommentForm from './comment_form';

import { createComment, updateComment } from '../../actions/comment_actions';

const mapStateToProps = (state, ownProps) => {
  let comment = {
    body: '',
    project_id: parseInt(ownProps.match.params.projectId),
    author_id: ownProps.currentUser.id
  };

  return {
    comment,
    currentUser: ownProps.currentUser
  };
};

const mapDispatchToProps = dispatch => ({
  createComment: id => dispatch(createComment(id)),
  updateComment: comment => dispatch(updateComment(comment))
});

export default withRouter(
  connect(mapStateToProps, mapDispatchToProps)(CommentForm)
);
