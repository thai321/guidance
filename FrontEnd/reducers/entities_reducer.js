import { combineReducers } from 'redux';

import ProjectsReducer from './projects_reducer';
import UsersReducer from './users_reducer';
import StepsReducer from './steps_reducer';

const RootReducer = combineReducers({
  users: UsersReducer,
  projects: ProjectsReducer,
  steps: StepsReducer
});

export default RootReducer;
