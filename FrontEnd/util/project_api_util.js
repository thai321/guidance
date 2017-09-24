export const fetchProjects = (userId, filter = true) => {
  if (userId === undefined) {
    return $.ajax({
      method: 'GET',
      url: 'api/projects'
    });
  } else {
    return $.ajax({
      method: 'GET',
      url: 'api/projects',
      data: { project: { author_id: userId, filter } }
    });
  }
};

export const fetchProject = id =>
  $.ajax({
    method: 'GET',
    url: `api/projects/${id}`
  });

export const createProject = project =>
  $.ajax({
    method: 'POST',
    url: 'api/projects',
    data: { project }
  });

export const updateProject = project =>
  $.ajax({
    method: 'PATCH',
    url: `api/projects/${project.id}`,
    data: { project }
  });

export const deleteProject = id =>
  $.ajax({
    method: 'DELETE',
    url: `api/projects/${id}`
  });

export const createProjectForm = formData =>
  $.ajax({
    url: '/api/projects',
    method: 'POST',
    dataType: 'json',
    contentType: false,
    processData: false,
    data: formData
  });

export const updateProjectForm = (formData, id) =>
  $.ajax({
    url: `/api/projects/${id}`,
    method: 'PATCH',
    dataType: 'json',
    contentType: false,
    processData: false,
    data: formData
  });
