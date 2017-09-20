import { combineReducers } from 'redux';

import ProjectsReducer from './projects_reducer';

const RootReducer = combineReducers({
  projects: ProjectsReducer
});

export default RootReducer;
