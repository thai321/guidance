import React from 'react';
import { Link } from 'react-router-dom';

class StepItem extends React.Component {
  render() {
    const { id, title, body } = this.props.step;
    const { projectId, count, author, currentUser, removeStep } = this.props;

    const displayButtons = authorId => {
      let editButton = () => '';
      if (currentUser && authorId === currentUser.id) {
        editButton = () => (
          <div className="step-item-buttons-group">
            <Link className="" to={`/projects/${projectId}/steps/${id}/edit`}>
              <i className="fa fa-pencil fa-4x" />
            </Link>
            <i className="fa fa-trash fa-4x" onClick={() => removeStep(id)} />
          </div>
        );
      }

      return (
        <div className="step-item-buttons">
          <div>
            <span className="step-item-count">Step {count}</span>
          </div>

          {editButton()}
        </div>
      );
    };

    return (
      <div>
        <div className="step-item">
          {displayButtons(author.id)}

          <span className="step-item-title">{title}</span>
          <div
            className="ql-editor"
            dangerouslySetInnerHTML={{ __html: body }}
          />
        </div>
      </div>
    );
  }
}

export default StepItem;
