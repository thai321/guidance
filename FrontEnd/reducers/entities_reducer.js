import { combineReducers } from 'redux';

import ProjectsReducer from './projects_reducer';
import UsersReducer from './users_reducer';

const RootReducer = combineReducers({
  projects: ProjectsReducer,
  users: UsersReducer
});

export default RootReducer;
