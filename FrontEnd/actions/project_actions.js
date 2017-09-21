import * as ProjectApiUtil from '../util/project_api_util';

export const RECEIVE_ALL_PROJECTS = 'RECEIVE_ALL_PROJECTS';
export const RECEIVE_PROJECT = 'RECEIVE_PROJECT';
export const REMOVE_PROJECT = 'REMOVE_PROJECT';

const receiveAllProjects = projects => ({
  type: RECEIVE_ALL_PROJECTS,
  projects
});

const receiveProject = project => ({
  type: RECEIVE_PROJECT,
  project
});

const removeProject = project => ({
  type: REMOVE_PROJECT,
  project
});

export const fetchProjects = filter => dispatch =>
  ProjectApiUtil.fetchProjects(filter).then(projects =>
    dispatch(receiveAllProjects(projects))
  );

export const fetchProject = id => dispatch =>
  ProjectApiUtil.fetchProject(id).then(project =>
    dispatch(receiveProject(project))
  );

export const createProject = project => dispatch =>
  ProjectApiUtil.createProject(project).then(proj =>
    dispatch(receiveProject(proj))
  );

export const updateProject = project => dispatch =>
  ProjectApiUtil.updateProject(project).then(proj =>
    dispatch(receiveProject(proj))
  );

export const deleteProject = id => dispatch =>
  ProjectApiUtil.deleteProject(id).then(proj => dispatch(removeProject(proj)));
