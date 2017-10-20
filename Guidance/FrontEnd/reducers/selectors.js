import { fetchProjects } from '../util/project_api_util';

export const projectByIds = ids => {
  const projects = [];

  fetchProjects(ids).then(projectsPromise => {
    Object.values(projectsPromise).forEach(project => {
      projects.push(project);
    });
  });

  return projects;
};
