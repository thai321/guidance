import { RECEIVE_ALL_USERS, RECEIVE_USER } from '../actions/user_actions';

import {
  RECEIVE_FOLLOW_USERS,
  RECEIVE_FOLLOWEES
} from '../actions/user_actions';

import { RECEIVE_FOLLOW, REMOVE_FOLLOW } from '../actions/follow_actions';

const _defaultState = {
  allIds: []
};

const UsersReducer = (state = _defaultState, action) => {
  Object.freeze(state);
  let newState;

  switch (action.type) {
    case RECEIVE_ALL_USERS:
      const users = Object.values(action.users);
      const allIds = users.map(user => user.id);
      newState = { allIds };

      users.map(user => (newState[user.id] = user));

      return newState;

    case RECEIVE_USER:
      newState = Object.assign({}, state);
      newState[action.user.id] = action.user;
      if (!newState.allIds.includes(action.user.id))
        newState.allIds.push(action.user.id);
      return newState;

    case RECEIVE_FOLLOW_USERS:
      newState = Object.assign({}, state);
      return Object.assign(newState, action.users);

    case RECEIVE_FOLLOW:
      newState = Object.assign({}, state);
      const id = action.follow.followeeId;
      newState[id].followers.push(parseInt(id));
      return newState;

    case REMOVE_FOLLOW:
      newState = Object.assign({}, state);
      const { followeeId, followerId } = action.follow;

      const idx = newState[followeeId].followers.indexOf(followerId);
      newState[followeeId].followers.splice(idx, 1);
      return newState;

    default:
      return state;
  }
};

export default UsersReducer;
