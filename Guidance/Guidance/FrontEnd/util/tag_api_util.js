export const fetchTags = () =>
  $.ajax({
    method: 'GET',
    url: 'api/tags'
  });

export const fetchTag = name =>
  $.ajax({
    method: 'GET',
    url: 'api/tags',
    data: { tag: { name } }
  });
