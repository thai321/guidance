import React from 'react';
import { withRouter } from 'react-router-dom';

import { uniqueId } from '../../util/id_generator';

import CommentDetail from './comment_detail';
import CommentFormContainer from './comment_form_container';

class CommentShow extends React.Component {
  constructor(props) {
    super(props);

    this.displayCommentForm = this.displayCommentForm.bind(this);
  }

  displayCommentForm() {
    if (this.props.project.published && this.props.currentUser) {
      return (
        <div className="comment-show-form">
          <h2>Leave a Comment</h2>
          <CommentFormContainer currentUser={this.props.currentUser} />
        </div>
      );
    }
  }

  render() {
    const { comments, project, currentUser } = this.props;

    const text = comments.length > 0 ? 'Comments' : '';

    return (
      <div className="comment-show">
        {this.displayCommentForm()}

        <h2>{text}</h2>
        {comments.map((comment, i) => (
          <CommentDetail
            key={comment.id + comment.author + i + uniqueId()}
            comment={comment}
            project={project}
            currentUser={currentUser}
          />
        ))}
      </div>
    );
  }
}

export default withRouter(CommentShow);
