export const fetchSteps = project_id =>
  $.ajax({
    method: 'GET',
    url: 'api/steps',
    data: { step: { project_id } }
  });

export const fetchStep = id =>
  $.ajax({
    method: 'GET',
    url: `api/steps/${id}`
  });

export const createStep = step =>
  $.ajax({
    method: 'POST',
    url: 'api/steps',
    data: { step }
  });

export const updateStep = step =>
  $.ajax({
    method: 'PATCH',
    url: `api/steps/${step.id}`,
    data: { step }
  });

export const deleteStep = id =>
  $.ajax({
    method: 'DELETE',
    url: `api/steps/${id}`,
    data: { step: { id } }
  });
