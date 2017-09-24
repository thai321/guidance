import {
  RECEIVE_PROJECT_COMMENTS,
  RECEIVE_PROJECT_COMMENT
} from '../actions/comment_actions';

const CommentsReducer = (state = {}, action) => {
  Object.freeze(state);
  let newState;

  switch (action.type) {
    case RECEIVE_PROJECT_COMMENTS:
      return Object.assign({}, action.comments);
    case RECEIVE_PROJECT_COMMENT:
      newState = Object.assign({}, state);
      newState[action.comment.id] = action.comment;
      return newState;
    default:
      return state;
  }
};

export default CommentsReducer;
