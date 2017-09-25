import React from 'react';

import { Link, withRouter } from 'react-router-dom';

const CommentDetail = ({ comment, currentUser, project }) => {
  const { id, description, author, author_id, time } = comment;

  const displayEdit = () => {
    if (project.published && currentUser && author_id === currentUser.id) {
      return (
        <button className="btn btn-outline-warning btn-small">Edit</button>
      );
    }
  };

  return (
    <div className="comment-detail">
      <div className="row">
        <div className="col-md-12">
          <div dangerouslySetInnerHTML={{ __html: description }} />
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
