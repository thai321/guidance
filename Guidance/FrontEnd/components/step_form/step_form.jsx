import React from 'react';

import { withRouter } from 'react-router-dom';

class StepForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = this.props.step;

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  componentDidMount(ownProps) {
    console.log('ownProps: ', ownProps);
    const { projectId } = this.props.match.params;
    this.props
      .fetchProject(projectId)
      .then(() => this.props.fetchSteps(projectId));
  }

  componentWillReceiveProps(ownProps) {
    this.setState(ownProps.step);
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
    debugger;
    e.preventDefault();
    const { projectId } = this.props.match.params;
    this.props
      .action(this.state)
      .then(() => this.props.history.push(`/projects/${projectId}`));
  }

  render() {
    // debugger;

    if (!this.props.step) {
      return (
        <div>
          <h1>Loading...</h1>
        </div>
      );
    }

    const { title, body } = this.props.step;
    const text = this.props.formType === 'new' ? 'Create Step' : 'Update Step';

    return (
      <div>
        <form onSubmit={this.handleSubmit}>
          <label>
            Title
            <input
              type="text"
              value={this.state.title}
              onChange={this.update('title')}
            />
          </label>

          <label>
            Body
            <textarea value={this.state.body} onChange={this.update('body')} />
          </label>

          <input type="submit" value={text} />
        </form>
      </div>
    );
  }
}

export default withRouter(StepForm);
