import { connect } from 'react-redux';

import CommentShow from './comment_show';

import { fetchComments } from '../../actions/comment_actions';

const mapStateToProps = (state, ownProps) => {
  const comments = Object.values(state.entities.comments).reverse();
  const { currentUser } = state.session.currentUser;

  return {
    comments,
    currentUser
  };
};

const mapDispatchToProps = dispatch => ({
  fetchComments: projectId => dispatch(fetchComments(projectId))
});

export default connect(mapStateToProps, mapDispatchToProps)(CommentShow);
