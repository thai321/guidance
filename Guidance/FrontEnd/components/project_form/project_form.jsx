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

    if (this.props.formType === 'new') {
      this.props
        .createProjectOption(formData)
        .then(() => this.props.history.push('/'));
    } else {
      const id = this.props.match.params.projectId;
      this.props
        .updateProjectOption(formData, id)
        .then(() => this.props.history.push('/'));
    }
  }

  updateFile(e) {
    const file = e.currentTarget.files[0];
    const fileReader = new FileReader();

    fileReader.onloadend = () => {
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
                <form className="form-horizontal">
                  <legend className="text-center header">New Project</legend>

                  <div className="form-group">
                    <span className="col-md-1 col-md-offset-2 text-center">
                      <i className="fa fa-file-text bigicon fa-lg" />
                    </span>

                    <div className="col-md-10">
                      <input
                        className="form-control"
                        type="text"
                        placeholder="Title"
                        value={this.state.title}
                        onChange={this.update('title')}
                      />
                    </div>
                  </div>

                  <span className="col-md-1 col-md-offset-2 text-center">
                    <i className="fa fa-pencil-square-o bigicon fa-lg" />
                  </span>

                  <div className="col-md-10">
                    <ReactQuill
                      className="description-quill"
                      placeholder="Enter The Project's Description"
                      modules={ProjectForm.modules}
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

                  <div className="image-project-form">
                    <div className="form-group">
                      <span className="col-md-1 col-md-offset-2 text-center">
                        <i className="fa fa-file-image-o bigicon fa-lg" />
                      </span>

                      <input
                        type="file"
                        placeholder="Upload Your image"
                        onChange={this.updateFile}
                      />
                    </div>
                  </div>

                  <div className="form-group">
                    <span className="col-md-1 col-md-offset-2 ">
                      <i className="fa fa-video-camera bigicon fa-lg" />
                    </span>

                    <div className="col-md-10">
                      <input
                        className="form-control"
                        type="text"
                        placeholder="Paste Your Video URL"
                        value={this.state.video_url}
                        onChange={this.update('video_url')}
                      />
                    </div>
                  </div>

                  <div className="form-group">
                    <div className="project-form-submit-button">
                      <button
                        className="btn btn-primary btn-lg"
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
    );
  }
}

ProjectForm.modules = {
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

export default ProjectForm;
