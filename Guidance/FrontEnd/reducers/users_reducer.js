import { RECEIVE_ALL_USERS, RECEIVE_USER } from '../actions/user_actions';

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

    default:
      return state;
  }
};

export default UsersReducer;
