export const fetchUsers = () =>
  $.ajax({
    method: 'GET',
    url: 'api/users'
  });

export const fetchUser = id =>
  $.ajax({
    method: 'GET',
    url: `api/users/${id}`
  });

export const updateUser = user =>
  $.ajax({
    method: 'PATCH',
    url: `api/users/${user.id}`,
    data: { user }
  });

export const updateUserForm = (formData, id) =>
  $.ajax({
    url: `/api/users/${id}`,
    method: 'PATCH',
    dataType: 'json',
    contentType: false,
    processData: false,
    data: formData
  });

export const fetchFollowers = followee_id => {
  return $.ajax({
    method: 'GET',
    url: 'api/users',
    data: { user: { followee_id } }
  });
};

export const fetchFollowees = follower_id => {
  return $.ajax({
    method: 'GET',
    url: 'api/users',
    data: { user: { follower_id } }
  });
};
