import * as ProjectApiUtil from '../util/project_api_util';

export const RECEIVE_ALL_PROJECTS = 'RECEIVE_ALL_PROJECTS';
export const RECEIVE_PROJECT = 'RECEIVE_PROJECT';
export const REMOVE_PROJECT = 'REMOVE_PROJECT';
export const RECEIVE_FAVORITE_PROJECTS = 'RECEIVE_FAVORITE_PROJECTS';

export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS';

const receiveAllProjects = projects => ({
  type: RECEIVE_ALL_PROJECTS,
  projects
});

const receiveProject = project => ({
  type: RECEIVE_PROJECT,
  project
});

const receiveFavoriteProjects = projects => ({
  type: RECEIVE_FAVORITE_PROJECTS,
  projects
});

const removeProject = project => ({
  type: REMOVE_PROJECT,
  project
});

export const receiveErrors = errors => ({
  type: RECEIVE_SESSION_ERRORS,
  errors
});

export const fetchProjects = (userId, filter) => dispatch =>
  ProjectApiUtil.fetchProjects(userId, filter)
    .then(projects => dispatch(receiveAllProjects(projects)))
    .fail(errors => dispatch(receiveErrors(errors.responseJSON)));

export const fetchProject = id => dispatch =>
  ProjectApiUtil.fetchProject(id)
    .then(project => dispatch(receiveProject(project)))
    .fail(errors => dispatch(receiveErrors(errors.responseJSON)));

export const createProject = project => dispatch =>
  ProjectApiUtil.createProject(project)
    .then(proj => dispatch(receiveProject(proj)))
    .fail(errors => dispatch(receiveErrors(errors.responseJSON)));

export const updateProject = project => dispatch =>
  ProjectApiUtil.updateProject(project)
    .then(proj => dispatch(receiveProject(proj)))
    .fail(errors => dispatch(receiveErrors(errors.responseJSON)));

export const deleteProject = id => dispatch =>
  ProjectApiUtil.deleteProject(id)
    .then(proj => dispatch(removeProject(proj)))
    .fail(errors => dispatch(receiveErrors(errors.responseJSON)));

export const createProjectOption = (formData, callback) => dispatch =>
  ProjectApiUtil.createProjectForm(formData, callback)
    .then(proj => dispatch(receiveProject(proj)))
    .fail(errors => dispatch(receiveErrors(errors.responseJSON)));

export const updateProjectOption = (formData, id) => dispatch =>
  ProjectApiUtil.updateProjectForm(formData, id)
    .then(proj => dispatch(receiveProject(proj)))
    .fail(errors => dispatch(receiveErrors(errors.responseJSON)));

export const fetchFavoriteProjects = projectIds => dispatch =>
  ProjectApiUtil.fetchProjects(projectIds)
    .then(projects => dispatch(receiveFavoriteProjects(projects)))
    .fail(errors => dispatch(receiveErrors(errors.responseJSON)));

export const fetchTagProjects = name => dispatch =>
  ProjectApiUtil.fetchProjects(name)
    .then(projects => dispatch(receiveAllProjects(projects)))
    .fail(errors => dispatch(receiveErrors(errors.responseJSON)));
