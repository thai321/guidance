import { combineReducers } from 'redux';

import ProjectsReducer from './projects_reducer';
import UsersReducer from './users_reducer';
import StepsReducer from './steps_reducer';
import CommentsReducer from './comments_reducer';

const RootReducer = combineReducers({
  users: UsersReducer,
  projects: ProjectsReducer,
  steps: StepsReducer,
  comments: CommentsReducer
});

export default RootReducer;
