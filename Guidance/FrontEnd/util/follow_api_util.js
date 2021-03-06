export const fetchFollows = id => {
  return $.ajax({
    method: 'GET',
    url: 'api/follows'
  });
};

export const createFollow = follow => {
  return $.ajax({
    method: 'POST',
    url: 'api/follows',
    data: { follow }
  });
};

export const deteleFollow = follow => {
  return $.ajax({
    method: 'DELETE',
    url: `api/follows/1`,
    data: { follow }
  });
};
