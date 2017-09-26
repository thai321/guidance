import React from 'react';
import { Link } from 'react-router-dom';

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
    const { currentUser, formType } = this.props;

    if (!currentUser) {
      this.props.history.push('/');
    }
    if (projectId) this.props.fetchProject(projectId);
  }

  componentWillReceiveProps(nextProps) {
    this.setState(nextProps.project);
  }

  update(type) {
    return e => {
      e.preventDefault();
      if (type === 'video_url') {
        const regex = /^.*(youtu.be\/|v\/|e\/|u\/\w+\/|embed\/|v=)([^#\&\?]*).*/;
        const temp = this.state.video_url + e.target.value;
        if (temp.match(regex)) {
          const video_url =
            'https://www.youtube.com/embed/' + temp.match(regex)[2];
          this.setState({ video_url });
        }
      } else {
        const value =
          type === 'author' ? Number(e.target.value) : e.target.value;

        this.setState({ [type]: value });
      }
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

    if (this.props.formType === 'new') {
      this.props
        .createProjectOption(formData)
        .then(action =>
          this.props.history.push(`/projects/${action.project.id}`)
        );
    } else {
      const { projectId } = this.props.match.params;
      this.props
        .updateProjectOption(formData, projectId)
        .then(() => this.props.history.push(`/projects/${projectId}`));
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

  displayBack() {
    const path =
      this.props.formType === 'new'
        ? '/'
        : `/projects/${this.props.project.id}`;

    return (
      <Link to={path}>
        <i className="fa fa-arrow-circle-o-left fa-4x back-button" />
      </Link>
    );
  }

  render() {
    if (!this.props.project) {
      return <div className="loader" />;
    }

    const text =
      this.props.formType === 'new' ? 'Create Project' : 'Update Project';

    const header =
      this.props.formType === 'new' ? 'New Project' : 'Edit Project';

    const {
      id,
      title,
      description,
      image_url,
      video_url,
      author_id
    } = this.props.project;

    return (
      <div className="project_form_container">
        <form className="project-form">
          {this.displayBack()}

          <button
            className="btn btn-primary btn-lg"
            type="submit"
            onClick={this.handleSubmit}
          >
            {text}
          </button>

          <div className="form-group">
            <span className="col-md-1 col-md-offset-2 text-center">
              <i className="fa fa-pencil bigicon fa-lg" />
            </span>

            <input
              className="project-form-title"
              type="text"
              placeholder="Title"
              value={this.state.title}
              onChange={this.update('title')}
            />
          </div>

          <div className="project-form-description">
            <span className="col-md-1 col-md-offset-2 text-center">
              <i className="fa fa-pencil-square-o bigicon fa-lg" />
            </span>

            <ReactQuill
              className="description-quill"
              placeholder="Enter The Project's Description"
              modules={ProjectForm.modules}
              value={this.state.description}
              onChange={this.handleChange}
            />
          </div>

          <div className="image-project-form">
            <span className="col-md-1 col-md-offset-2 text-center">
              <i className="fa fa-file-image-o bigicon fa-lg" />
            </span>

            <input
              type="file"
              placeholder="Upload Your image"
              onChange={this.updateFile}
            />
          </div>

          <div className="form-group">
            <span className="col-md-1 col-md-offset-2 ">
              <i className="fa fa-video-camera bigicon fa-lg" />
            </span>

            <input
              className="form-control"
              type="text"
              placeholder="Paste Your Video URL"
              value={this.state.video_url}
              onChange={this.update('video_url')}
            />
          </div>

          <iframe
            width="560"
            height="315"
            src={this.state.video_url}
            frameBorder="0"
            allowFullScreen
          />
          <div className="project-form-submit-button" />
        </form>
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
