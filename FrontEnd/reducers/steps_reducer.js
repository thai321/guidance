import {
  RECEIVE_PROJECT_STEPS,
  RECEIVE_PROJECT_STEP,
  REMOVE_PROJECT_STEP
} from '../actions/step_actions';

const StepsReducer = (state = {}, action) => {
  Object.freeze(state);
  let newState;

  switch (action.type) {
    case RECEIVE_PROJECT_STEPS:
      return Object.assign({}, action.steps);

    case RECEIVE_PROJECT_STEP:
      newState = Object.assign({}, state);
      newState[action.step.id] = action.step;
      return newState;

    case REMOVE_PROJECT_STEP:
      newState = Object.assign({}, state);
      delete newState[action.step.id];
      return newState;
    default:
      return state;
  }
};

export default StepsReducer;
