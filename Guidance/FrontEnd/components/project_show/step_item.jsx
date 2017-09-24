import React from 'react';
import { Link } from 'react-router-dom';

class StepItem extends React.Component {
  render() {
    const { id, title, body, project_id } = this.props.step;
    const { count, author, currentUser } = this.props;

    const displayEdit = (authorId, currentUserId) => {
      if (authorId === currentUserId) {
        return (
          <div className="step-item-buttons">
            <Link
              className="btn btn-warning"
              to={`/projects/${project_id}/steps/${id}/edit`}
            >
              <i className="fa fa-wrench fa-2x" />
            </Link>
            <a>
              <button className="btn btn-danger">
                <i className="fa fa-trash-o fa-2x" />
              </button>
            </a>
          </div>
        );
      }
    };

    return (
      <div>
        <div className="step-item">
          {displayEdit(author.id, currentUser.id)}
          <h1>Step {count}</h1>
          <h1>{title}</h1>
          <div dangerouslySetInnerHTML={{ __html: body }} />
        </div>
      </div>
    );
  }
}

export default StepItem;
