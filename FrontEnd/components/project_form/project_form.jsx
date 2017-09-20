import React from 'react';

class ProjectForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = this.props.project;

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentDidMount() {
    // debugger;
    const { projectId } = this.props.match.params;
    if (projectId) this.props.fetchProject(projectId);
  }

  componentWillReceiveProps(nextProps) {
    // debugger;
    this.setState(nextProps.project);
  }

  update(type) {
    return e => {
      e.preventDefault();
      const value = type === 'author' ? Number(e.target.value) : e.target.value;

      this.setState({ [type]: value });
    };
  }

  handleSubmit(e) {
    e.preventDefault();
    // debugger;
    this.props.action(this.state).then(() => this.props.history.push('/'));
  }

  render() {
    // debugger;

    if (!this.props.project) {
      return (
        <div>
          <h1>Loading...</h1>
        </div>
      );
    }

    const text =
      this.props.formType === 'new' ? 'Create Project' : 'Update Project';

    const {
      title,
      description,
      image_url,
      video_url,
      author_id
    } = this.props.project;

    return (
      <div>
        <h3>{text}</h3>
        <h1>{title}</h1>
        <h1>{description}</h1>
        <h1>{image_url}</h1>
        <h1>{video_url}</h1>
        <h1>{author_id}</h1>

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
            Description
            <textarea
              value={this.state.description}
              onChange={this.update('description')}
            />
          </label>

          <label>
            image_url
            <input
              type="text"
              value={this.state.image_url}
              onChange={this.update('image_url')}
            />
          </label>

          <label>
            video_url
            <input
              type="text"
              value={this.state.video_url}
              onChange={this.update('video_url')}
            />
          </label>

          <label>
            author_id
            <input
              type="number"
              value={this.state.author_id}
              onChange={this.update('author_id')}
            />
          </label>

          <input type="submit" value={text} />
        </form>
      </div>
    );
  }
}

export default ProjectForm;
