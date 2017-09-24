import React from 'react';

import { Link, withRouter } from 'react-router-dom';

const CommentDetail = ({ comment, currentUser }) => {
  const { id, body, author, author_id, time } = comment;

  const displayEdit = () => {
    if (currentUser && author_id === currentUser.id) {
      return (
        <button className="btn btn-outline-warning btn-small">Edit</button>
      );
    }
  };

  return (
    <div className="comment-detail">
      <div className="row">
        <div className="col-md-12">
          <div dangerouslySetInnerHTML={{ __html: body }} />
          <br />
          <h6>
            by {author}, {time} ago
          </h6>
          {displayEdit()}
        </div>
      </div>
    </div>
  );
};

export default CommentDetail;
