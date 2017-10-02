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

    this.state = Object.assign({ loading: false }, this.props.project);

    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateFile = this.updateFile.bind(this);
    this.handleChange = this.handleChange.bind(this);
    this.handleTagChange = this.handleTagChange.bind(this);
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
    const { projectId } = this.props.match.params;
    const nextId = nextProps.match.params.projectId;

    if (nextId != projectId) {
      this.props.fetchProject(nextId);
    }
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
    formData.append('tags', this.state.tags);

    if (this.state.imageFile) {
      formData.append('project[image]', this.state.imageFile);
    }

    if (this.props.formType === 'new') {
      this.setState({ loading: true });
      this.props.createProjectOption(formData).then(action => {
        // debugger;
        this.props.history.push(`/projects/${action.project.id}`);
      }, this.setState({ loading: false }));
    } else {
      const { projectId } = this.props.match.params;
      this.props
        .updateProjectOption(formData, projectId)
        .then(action => this.setState({ loading: true }))
        .then(() =>
          this.props.history
            .push(`/projects/${projectId}`)
            .then(this.setState({ loading: false }))
        );
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
        <i className="fa fa-arrow-circle-o-left fa-5x" />
      </Link>
    );
  }

  handleTagChange(e) {
    e.preventDefault();
    const value = e.currentTarget.querySelector('input').value;

    if (!this.state.tags.includes(value)) {
      this.setState({ tags: [...this.state.tags, value] });
    } else {
      const tags = this.state.tags;
      const idx = tags.indexOf(value);
      tags.splice(idx, 1);
    }
  }

  isActive(name) {
    const { tags } = this.state;
    return tags.includes(name) ? 'active' : '';
  }

  render() {
    if (!this.props.project) {
      return <div className="loader" />;
    }

    const text =
      this.props.formType === 'new' ? 'Save Guidance' : 'Update Guidance';

    const header =
      this.props.formType === 'new' ? 'New Guidance' : 'Edit Guidance';

    const {
      id,
      title,
      description,
      image_url,
      video_url,
      author_id
    } = this.props.project;

    const hideVideo = this.state.video_url ? '' : 'none';

    return (
      <div className="project_form_container">
        <div className="project-form-back-button">{this.displayBack()}</div>

        <form className="project-form">
          <div className="image-project-form">
            <span>Guidance Image</span>
            <div>
              <i className="fa fa-file-image-o bigicon fa-2x" />
              <input
                type="file"
                placeholder="Upload Your image"
                onChange={this.updateFile}
              />
            </div>
          </div>

          <div className="form-group">
            <i className="fa fa-pencil fa-2x" />

            <input
              className="project-form-title"
              type="text"
              placeholder="Title"
              value={this.state.title}
              onChange={this.update('title')}
            />
          </div>

          <div className="btn-group" data-toggle="buttons">
            <label
              onClick={this.handleTagChange}
              className={`btn btn-outline-primary ${this.isActive('Arduino')}`}
            >
              <input
                type="checkbox"
                value="Arduino"
                autoComplete="off"
              />Arduino
            </label>

            <label
              onClick={this.handleTagChange}
              className={`btn btn-outline-danger ${this.isActive('Math')}`}
            >
              <input type="checkbox" value="Math" autoComplete="off" />Math
            </label>

            <label
              onClick={this.handleTagChange}
              className={`btn btn-outline-info ${this.isActive(
                'Computer Science'
              )}`}
            >
              <input
                type="checkbox"
                value="Computer Science"
                autoComplete="off"
              />Computer Science
            </label>

            <label
              onClick={this.handleTagChange}
              className={`btn btn-outline-success ${this.isActive('Music')}`}
            >
              <input type="checkbox" value="Music" autoComplete="off" />Music
            </label>

            <label
              onClick={this.handleTagChange}
              className={`btn btn-outline-warning ${this.isActive('Other')}`}
            >
              <input type="checkbox" value="Other" autoComplete="off" />Other
            </label>
          </div>

          <div className="project-form-description">
            <i className="fa fa-pencil-square-o fa-2x" />

            <ReactQuill
              className="description-quill"
              placeholder="Enter The Project's Description"
              modules={ProjectForm.modules}
              value={this.state.description}
              onChange={this.handleChange}
            />
          </div>

          <div className="project-form-video">
            <div className="form-group">
              <i className="fa fa-video-camera bigicon fa-2x" />

              <input
                className="form-control"
                type="text"
                placeholder="Paste a Youtube URL video here"
                value={this.state.video_url}
                onChange={this.update('video_url')}
              />
            </div>

            <div className={`${hideVideo}`}>
              <iframe
                width="560"
                height="315"
                src={this.state.video_url}
                frameBorder="0"
                allowFullScreen
              />
            </div>

            <div className="project-form-button">
              <button
                className="btn btn-primary btn-lg"
                disabled={this.state.loading}
                type="submit"
                onClick={this.handleSubmit}
              >
                {this.state.loading ? 'Loading...' : `${text}`}
              </button>
            </div>
          </div>
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
