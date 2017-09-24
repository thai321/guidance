import React from 'react';
import { Link } from 'react-router-dom';

class StepItem extends React.Component {
  render() {
    const { id, title, body } = this.props.step;
    const { projectId, count, author, currentUser, removeStep } = this.props;

    const displayButtons = authorId => {
      if (currentUser && authorId === currentUser.id) {
        return (
          <div className="step-item-buttons">
            <Link
              className="btn btn-warning"
              to={`/projects/${projectId}/steps/${id}/edit`}
            >
              <i className="fa fa-wrench fa-2x" />
            </Link>
            <a>
              <button className="btn btn-danger" onClick={() => removeStep(id)}>
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
          {displayButtons(author.id)}
          <h1>Step {count}</h1>
          <h1>{title}</h1>
          <div dangerouslySetInnerHTML={{ __html: body }} />
        </div>
      </div>
    );
  }
}

export default StepItem;
