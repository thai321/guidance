import React from 'react';

import { withRouter } from 'react-router-dom';
import { Link } from 'react-router-dom';

import ReactQuill from 'react-quill';

class StepForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = this.props.step;

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  componentDidMount(ownProps) {
    const { projectId, stepId } = this.props.match.params;
    const { currentUser } = this.props;
    if (!currentUser) {
      this.props.history.push('/');
    }

    if (stepId) {
      this.props
        .fetchProject(projectId)
        .then(() => this.props.fetchStep(stepId));
    } else {
      this.props.fetchProject(projectId);
    }
  }

  componentWillReceiveProps(ownProps) {
    if (
      ownProps.step &&
      ownProps.match.path === '/projects/:projectId/steps/:stepId/edit'
    ) {
      this.setState(ownProps.step);
    }
  }

  handleChange(value) {
    this.setState({ body: value });
  }

  update(type) {
    return e => {
      e.preventDefault();
      this.setState({ [type]: e.target.value });
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    const { projectId } = this.props.match.params;
    this.props
      .action(this.state)
      .then(() => this.props.history.push(`/projects/${projectId}`));
  }

  render() {
    if (!this.props.step) {
      return <div className="loader" />;
    }

    const { title, body, project_id } = this.props.step;
    const text = this.props.formType === 'new' ? 'Create Step' : 'Update Step';
    const header =
      this.props.formType === 'new'
        ? 'New Step'
        : `Edit Step ${this.props.idx}`;

    return (
      <div>
        <div className="step-form-header">
          <Link to={`/projects/${project_id}`}>
            <i className="fa fa-arrow-circle-o-left fa-4x" />
          </Link>
          <h1>{header}</h1>
        </div>
        <div className="step-form">
          <form className="form-horizontal" onSubmit={this.handleSubmit}>
            <i className="fa fa-pencil bigicon fa-lg fa-2x" />
            <div className="form-group">
              <input
                className="form-control"
                placeholder="Name This Step"
                type="text"
                value={this.state.title}
                onChange={this.update('title')}
              />
            </div>

            <div className="project-form-description">
              <i className="fa fa-pencil-square-o bigicon fa-lg fa-2x" />
              <ReactQuill
                className="body-quill"
                placeholder="Write something here..."
                modules={StepForm.modules}
                value={this.state.body}
                onChange={this.handleChange}
              />
            </div>

            <div className="step-form-submit-button">
              <button className="btn btn-primary btn-lg" type="submit">
                {text}
              </button>
            </div>
          </form>
        </div>
      </div>
    );
  }
}

StepForm.modules = {
  syntax: true,
  formula: true,
  toolbar: [
    [{ header: '1' }, { header: '2' }, { font: [] }],
    [{ color: [] }, { background: [] }],
    [{ size: [] }],
    ['bold', 'italic', 'underline', 'strike', 'blockquote'],

    [
      { list: 'ordered' },
      { list: 'bullet' },
      { indent: '-1' },
      { indent: '+1' }
    ],
    ['link', 'image', 'video', 'code-block', 'formula']
  ]
};

export default withRouter(StepForm);
