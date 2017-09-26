export const fetchFollows = id => {
  return $.ajax({
    method: 'GET',
    url: 'api/follows'
  });
};

export const createFollow = (followee_id, follower_id) => {
  return $.ajax({
    method: 'POST',
    url: 'api/follows',
    data: { follow: { followee_id, follower_id } }
  });
};

export const deteleFollow = (followee_id, follower_id) => {
  return $.ajax({
    method: 'DELETE',
    url: `api/follows/${followee_id}`,
    data: { follow: { followee_id, follower_id } }
  });
};
