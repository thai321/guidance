import React from 'react';

import ReactQuill from 'react-quill';

import {
  createProjectOption,
  updateProject,
  updateProjectOption
} from '../../util/project_api_util';

class ProjectForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = this.props.project;

    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateFile = this.updateFile.bind(this);

    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(value) {
    this.setState({ description: value });
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
    const formData = new FormData();
    formData.append('project[title]', this.state.title);
    formData.append('project[description]', this.state.description);
    formData.append('project[video_url]', this.state.video_url);
    formData.append('project[author_id]', this.state.author_id);

    if (this.state.imageFile) {
      formData.append('project[image]', this.state.imageFile);
    }

    const { projectId } = this.props.match.params;
    const callback = () => console.log('success');

    if (this.props.formType === 'new') {
      createProjectOption(formData, callback).then(() =>
        this.props.history.push('/')
      );
    } else {
      const id = this.props.match.params.projectId;
      updateProjectOption(formData, id, callback).then(() =>
        this.props.history.push('/')
      );
    }
  }

  updateFile(e) {
    const file = e.currentTarget.files[0];
    const fileReader = new FileReader();

    fileReader.onloadend = () => {
      // debugger;
      this.setState({ imageFile: file, image_url: fileReader.result });
    };

    if (file) {
      fileReader.readAsDataURL(file);
    }
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
                          <ReactQuill
                            value={this.state.description}
                            onChange={this.handleChange}
                          />
                          {/*<textarea
                            className="form-control"
                            placeholder="Description"
                            value={this.state.description}
                            onChange={this.update('description')}
                          /> */}
                        </div>
                      </div>

                      <div className="form-group">
                        <span className="col-md-1 col-md-offset-2 text-center">
                          <i className="fa fa-file-image-o bigicon fa-lg" />
                        </span>
                        <div className="col-md-8">
                          <input
                            className="form-control"
                            type="file"
                            placeholder="Upload Your image"
                            onChange={this.updateFile}
                          />
                        </div>
                        <img src={this.state.image_url} />
                      </div>

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
