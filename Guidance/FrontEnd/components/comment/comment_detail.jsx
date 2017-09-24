import React from 'react';

import { Link, withRouter } from 'react-router-dom';

const CommentDetail = ({ comment, currentUser }) => {
  const { id, body, author, author_id, time } = comment;

  const displayEdit = () => {
    if (currentUser && author_id === currentUser.id) {
      return <button>Edit</button>;
    }
  };

  return (
    <div>
      <h4>{body}</h4>
      <h6>{author}</h6>
      <h6>{time} ago</h6>
      {displayEdit()}
    </div>
  );
};

export default CommentDetail;
