import { RECEIVE_CURRENT_USER } from '../actions/session_actions';
import { RECEIVE_FAVORITE, REMOVE_FAVORITE } from '../actions/favorite_actions';

const _nullSession = {
  currentUser: null
};

const SessionReducer = (state = _nullSession, action) => {
  Object.freeze(state);
  let newState;
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      const currentUser = action.user;
      return Object.assign({}, state, { currentUser });

    case RECEIVE_FAVORITE:
      newState = Object.assign({}, state);
      const { projectId } = action.favorite;
      newState.currentUser.favorite_projects.push(parseInt(projectId));
      return newState;

    case REMOVE_FAVORITE:
      newState = Object.assign({}, state);
      const projId = parseInt(action.favorite.projectId);
      const idx = newState.currentUser.favorite_projects.indexOf(projId);
      newState.currentUser.favorite_projects.splice(idx, 1);
      return newState;
    default:
      return state;
  }
};

export default SessionReducer;
