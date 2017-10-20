import * as FollowApiUtil from '../util/follow_api_util';

export const RECEIVE_FOLLOW = 'RECEIVE_FOLLOW';
export const REMOVE_FOLLOW = 'REMOVE_FOLLOW';
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS';

const receiveFollow = follow => ({
  type: RECEIVE_FOLLOW,
  follow
});

const removeFollow = follow => ({
  type: REMOVE_FOLLOW,
  follow
});

export const receiveErrors = errors => ({
  type: RECEIVE_SESSION_ERRORS,
  errors
});

export const createFollow = (followeeId, followerId) => dispatch =>
  FollowApiUtil.createFollow(followeeId, followerId)
    .then(follow => dispatch(receiveFollow(follow)))
    .fail(errors => dispatch(receiveErrors(errors.responseJSON)));

export const deteleFollow = (followeeId, followerId) => dispatch =>
  FollowApiUtil.deteleFollow(followeeId, followerId)
    .then(follow => dispatch(removeFollow(follow)))
    .fail(errors => dispatch(receiveErrors(errors.responseJSON)));
