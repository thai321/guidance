import * as UserApiUtil from '../util/user_api_util';

export const RECEIVE_ALL_USERS = 'RECEIVE_ALL_USERS';
export const RECEIVE_USER = 'RECEIVE_USER';
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS';

const receiveAllUsers = users => ({
  type: RECEIVE_ALL_USERS,
  users
});

const receiveUser = user => ({
  type: RECEIVE_USER,
  user
});

export const receiveErrors = errors => ({
  type: RECEIVE_SESSION_ERRORS,
  errors
});

export const fetchUsers = () => dispatch =>
  UserApiUtil.fetchUsers()
    .then(users => dispatch(receiveAllUsers(users)))
    .fail(errors => dispatch(receiveErrors(errors.responseJSON)));

export const fetchUser = id => dispatch =>
  UserApiUtil.fetchUser(id)
    .then(user => dispatch(receiveUser(user)))
    .fail(errors => dispatch(receiveErrors(errors.responseJSON)));

export const updateUser = user => dispatch =>
  UserApiUtil.updateUser(user)
    .then(ur => dispatch(receiveUser(ur)))
    .fail(errors => dispatch(receiveErrors(errors.responseJSON)));

export const updateUserOption = (formData, id, callback) => dispatch =>
  UserApiUtil.updateUserForm(formData, id, callback)
    .then(ur => dispatch(receiveUser(ur)))
    .fail(errors => dispatch(receiveErrors(errors.responseJSON)));
