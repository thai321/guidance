import React from 'react';

class ProjectForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = this.props.project;

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentDidMount() {
    const { projectId } = this.props.match.params;
    if (projectId) this.props.fetchProject(projectId);
  }

  componentWillReceiveProps(nextProps) {
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
    this.props.action(this.state).then(() => this.props.history.push('/'));
  }

  render() {
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
      <div className="project-form">
        <div className="project_form_container">
          <div className="container">
            <div className="row">
              <div className="col-md-12">
                <div className="well well-sm">
                  <form className="form-horizontal">
                    <div className="project-form-actual">
                      <legend className="text-center header">
                        New Project
                      </legend>

                      <div className="form-group">
                        <span className="col-md-1 col-md-offset-2 text-center">
                          <i className="fa fa-file-text bigicon fa-lg" />
                        </span>

                        <div className="col-md-8">
                          <input
                            className="form-control"
                            type="text"
                            placeholder="Title"
                            value={this.state.title}
                            onChange={this.update('title')}
                          />
                        </div>
                      </div>

                      <div className="form-group">
                        <span className="col-md-1 col-md-offset-2 text-center">
                          <i className="fa fa-pencil-square-o bigicon fa-lg" />
                        </span>

                        <div className="col-md-8">
                          <textarea
                            className="form-control"
                            placeholder="Description"
                            value={this.state.description}
                            onChange={this.update('description')}
                          />
                        </div>
                      </div>

                      {/*
                      <div className="form-group">
                        <span className="col-md-1 col-md-offset-2 text-center">
                          <i className="fa fa-file-image-o bigicon fa-lg" />
                        </span>
                        <div className="col-md-8">
                          <input
                            className="form-control"
                            type="text"
                            placeholder="Upload Your image"
                            value={this.state.image_url}
                            onChange={this.update('image_url')}
                          />
                        </div>
                      </div>

                      */}
                      <div className="form-group">
                        <span className="col-md-1 col-md-offset-2 text-center">
                          <i className="fa fa-video-camera bigicon fa-lg" />
                        </span>
                        <div className="col-md-8">
                          <input
                            className="form-control"
                            type="text"
                            placeholder="Upload Your Video"
                            value={this.state.video_url}
                            onChange={this.update('video_url')}
                          />
                        </div>
                      </div>

                      <div className="project-form-submit-button">
                        <button
                          className="btn btn-primary btn-block"
                          type="submit"
                          onClick={this.handleSubmit}
                        >
                          {text}
                        </button>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default ProjectForm;
