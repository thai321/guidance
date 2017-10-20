import * as CommentApiUtil from '../util/comment_api_util';

export const RECEIVE_PROJECT_COMMENTS = 'RECEIVE_PROJECT_COMMENTS';
export const RECEIVE_PROJECT_COMMENT = 'RECEIVE_PROJECT_COMMENT';
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS';

const receiveProjectComments = comments => ({
  type: RECEIVE_PROJECT_COMMENTS,
  comments
});

const receiveProjectComment = comment => ({
  type: RECEIVE_PROJECT_COMMENT,
  comment
});

export const receiveErrors = errors => ({
  type: RECEIVE_SESSION_ERRORS,
  errors
});

export const fetchComments = projectId => dispatch =>
  CommentApiUtil.fetchComments(projectId).then(comments =>
    dispatch(receiveProjectComments(comments))
  );

export const fetchComment = projectId => dispatch =>
  CommentApiUtil.fetchComment(projectId).then(comment =>
    dispatch(receiveProjectComment(comment))
  );

export const createComment = comment => dispatch =>
  CommentApiUtil.createComment(comment)
    .then(com => dispatch(receiveProjectComment(com)))
    .fail(errors => dispatch(receiveErrors(errors.responseJSON)));

export const updateComment = comment => dispatch =>
  CommentApiUtil.updateComment(comment)
    .then(com => dispatch(receiveProjectComment(com)))
    .fail(errors => dispatch(receiveErrors(errors.responseJSON)));
