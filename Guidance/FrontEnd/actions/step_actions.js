import * as StepApiUtil from '../util/step_api_util';

export const RECEIVE_PROJECT_STEPS = 'RECEIVE_PROJECT_STEPS';
export const RECEIVE_PROJECT_STEP = 'RECEIVE_PROJECT_STEP';
export const REMOVE_PROJECT_STEP = 'REMOVE_PROJECT_STEP';
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS';

const receiveProjectSteps = steps => ({
  type: RECEIVE_PROJECT_STEPS,
  steps
});

const receiveProjectStep = step => ({
  type: RECEIVE_PROJECT_STEP,
  step
});

const removeProjectStep = step => ({
  type: REMOVE_PROJECT_STEP,
  step
});

export const receiveErrors = errors => ({
  type: RECEIVE_SESSION_ERRORS,
  errors
});

export const fetchSteps = project_id => dispatch =>
  StepApiUtil.fetchSteps(project_id)
    .then(steps => dispatch(receiveProjectSteps(steps)))
    .fail(errors => dispatch(receiveErrors(errors.responseJSON)));

export const fetchStep = id => dispatch =>
  StepApiUtil.fetchStep(id)
    .then(step => dispatch(receiveProjectStep(step)))
    .fail(errors => dispatch(receiveErrors(errors.responseJSON)));

export const createStep = step => dispatch =>
  StepApiUtil.createStep(step)
    .then(st => dispatch(receiveProjectStep(st)))
    .fail(errors => dispatch(receiveErrors(errors.responseJSON)));

export const updateStep = step => dispatch =>
  StepApiUtil.updateStep(step)
    .then(st => dispatch(receiveProjectStep(st)))
    .fail(errors => dispatch(receiveErrors(errors.responseJSON)));

export const removeStep = id => dispatch =>
  StepApiUtil.deleteStep(id)
    .then(step => dispatch(removeProjectStep(step)))
    .fail(errors => dispatch(receiveErrors(errors.responseJSON)));
