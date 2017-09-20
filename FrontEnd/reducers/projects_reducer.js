import {
  RECEIVE_ALL_PROJECTS,
  RECEIVE_PROJECT,
  REMOVE_PROJECT
} from '../actions/project_actions';

const _defaultState = {
  allIds: []
};

const ProjectsReducer = (state = _defaultState, action) => {
  Object.freeze(state);
  let newState;

  switch (action.type) {
    case RECEIVE_ALL_PROJECTS:
      const projects = Object.values(action.projects);
      const allIds = projects.map(project => project.id);
      newState = { allIds };

      projects.map(project => (newState[project.id] = project));

      return newState;

    case RECEIVE_PROJECT:
      newState = Object.assign({}, state);
      newState[action.project.id] = action.project;
      if (!newState.allIds.includes(action.project.id))
        newState.allIds.push(action.project.id);

      return newState;
    case REMOVE_PROJECT:
      newState = Object.assign({}, state);

      const projectId = action.project.id;
      // if (newState.allIds.includes(action.project.id)) {
      const i = newState.allIds.indexOf(action.project.id);
      newState.allIds = newState.allIds
        .slice(0, i)
        .concat(newState.allIds.slice(i + 1));

      delete newState[projectId];
      // }

      return newState;
    default:
      return state;
  }
};

export default ProjectsReducer;
