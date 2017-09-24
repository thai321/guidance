import React from 'react';
import { withRouter } from 'react-router-dom';

import { uniqueId } from '../../util/id_generator';

import CommentDetail from './comment_detail';
import CommentFormContainer from './comment_form_container';

class CommentShow extends React.Component {
  componentDidMount() {
    this.props.fetchComments(this.props.match.params.projectId);
  }

  componentWillReceiveProps(nextProps) {
    const { projectId } = this.props.match.params;
    const nextId = nextProps.match.params.projectId;
    if (nextId !== projectId) {
      this.props.fetchComments(nextProps.match.params.projectId);
    }
  }

  render() {
    const { comments } = this.props;
    return (
      <div className="comment-show">
        <CommentFormContainer currentUser={this.props.currentUser} />

        {comments.map((comment, i) => (
          <CommentDetail
            key={comment.id + comment.author + i + uniqueId()}
            comment={comment}
            currentUser={this.props.currentUser}
          />
        ))}
      </div>
    );
  }
}

export default withRouter(CommentShow);
