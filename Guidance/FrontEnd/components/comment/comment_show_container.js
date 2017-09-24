import { connect } from 'react-redux';

import CommentShow from './comment_show';

import { fetchComments } from '../../actions/comment_actions';

const mapStateToProps = (state, ownProps) => {
  const comments = Object.values(state.entities.comments).reverse();

  return {
    comments,
    currentUser: ownProps.user
  };
};

const mapDispatchToProps = dispatch => ({
  fetchComments: projectId => dispatch(fetchComments(projectId))
});

export default connect(mapStateToProps, mapDispatchToProps)(CommentShow);
