export const fetchSteps = project_id =>
  $.ajax({
    method: 'GET',
    url: 'api/steps',
    data: { step: { project_id } }
  });
