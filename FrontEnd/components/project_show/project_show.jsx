import React from 'react';
import { Link } from 'react-router-dom';

import { uniqueId } from '../../util/id_generator';

import StepItem from './step_item';
import CommentShowContainer from '../comment/comment_show_container';

class ProjectShow extends React.Component {
  constructor(props) {
    super(props);

    this.state = { user: null, published: null };

    this.publishedToggle = this.publishedToggle.bind(this);
    this.displayButton = this.displayButton.bind(this);
    this.toggleLike = this.toggleLike.bind(this);
  }

  componentDidMount() {
    const { projectId } = this.props.match.params;

    this.props.fetchProject(projectId).then(action => {
      const { project } = action;
      this.setState({ published: project.published });

      if (project.step_ids.length > 0) {
        this.props.fetchSteps(project.id);
      }

      this.props.fetchUser(project.author_id).then(user => {
        this.setState({ user: user.user });
      });

      this.props.fetchComments(projectId);
    });
  }

  componentWillReceiveProps(nextProps) {
    const currentId = this.props.match.params.projectId;
    const nextId = nextProps.match.params.projectId;
    if (currentId !== nextId) this.props.fetchProject(nextId);
  }

  displayButton(type, authorId) {
    const { currentUser } = this.props;

    if (currentUser) {
      if (authorId === currentUser.id) {
        const { projectId } = this.props.match.params;

        if (type === 'new') {
          return (
            <div className="add-step-button">
              <Link
                className="fa fa-plus-circle fa-4x"
                to={`/projects/${projectId}/steps/new`}
              >
                <span>Add New Step</span>
              </Link>
            </div>
          );
        } else {
          return (
            <Link className="btn" to={`/projects/${projectId}/edit`}>
              <i className="fa fa-cog fa-3x" />
            </Link>
          );
        }
      }
    }
  }

  publishedToggle(e) {
    e.preventDefault();
    const project = this.props.project;
    project.published = !project.published;
    this.props.updateProject(project);
  }

  displayPublish(authorId, publishedText) {
    const { currentUser } = this.props;
    const custom =
      publishedText === 'Publish This Project'
        ? 'btn-outline-success'
        : 'btn-outline-warning';
    if (currentUser && currentUser.id === authorId) {
      return (
        <button className={`btn ${custom}`} onClick={this.publishedToggle}>
          {publishedText}
        </button>
      );
    }
  }

  displayTags() {
    const { tags } = this.props.project;
    const badges = {
      Arduino: 'primary',
      Math: 'danger',
      'Computer Science': 'info',
      Music: 'success',
      Other: 'warning'
    };

    return (
      <div className="project-index-item-tag">
        {tags.map((name, idx) => (
          <span
            key={name + idx + uniqueId()}
            className={`badge badge-${badges[name]}`}
          >{`${name}`}</span>
        ))}
      </div>
    );
  }

  isLiked() {
    let likeText = 'Like';
    const { currentUser } = this.props;

    if (currentUser) {
      const currentUserFavorites = currentUser.favorite_projects;

      if (currentUserFavorites.indexOf(this.props.project.id) !== -1) {
        likeText = 'Unlike';
      }
    }

    return likeText;
  }

  toggleLike() {
    const favorite = {
      project_id: this.props.project.id,
      user_id: this.props.currentUser ? this.props.currentUser.id : null
    };

    if (this.isLiked() === 'Like') {
      this.props.createFavorite(favorite);
    } else {
      this.props.deleteFavorite(favorite);
    }
  }

  render() {
    const { project } = this.props;
    const { user } = this.state;
    if (!project || !user) {
      return <div className="loader" />;
    }

    const publishedText = project.published
      ? 'Unpublish This Project'
      : 'Publish This Project';

    const steps = this.props.steps;

    const displayLike = () => {
      const thumb =
        this.isLiked() === 'Like' ? 'fa-thumbs-o-up' : 'fa-thumbs-up';

      if (project.published) {
        return (
          <div className="project-show-buttons-likes">
            <i className={`fa ${thumb} fa-3x`} onClick={this.toggleLike} />
            <span>{project.favorite_users.length}</span>
          </div>
        );
      }
    };

    const hideVideo = project.video_url ? '' : 'none';

    return (
      <div className="project-show-page">
        <div>{this.displayTags()}</div>

        <div className="project-show-buttons">
          <div className="project-show-buttons-user-info">
            <Link className="project-show-back-to-index" to="/">
              <i className="fa fa-home fa-2x" />
            </Link>

            <Link
              className="project-show-back-to-index"
              to={`/users/${user.id}`}
            >
              <i className="fa fa-user fa-2x" />
            </Link>

            {displayLike()}
          </div>

          <div className="project-show-button-user-project">
            <div>{this.displayButton('edit', user.id)}</div>
            <div>{this.displayPublish(user.id, publishedText)}</div>
          </div>
        </div>

        <div className="project-show">
          <h1 className="project-show-title">{project.title}</h1>
          <img className="project-show-img" src={project.image_url} />
        </div>

        <div className="project-show-description">
          <span>Description</span>
          <div
            className="ql-editor"
            dangerouslySetInnerHTML={{ __html: project.description }}
          />
        </div>

        <div className={`project-show-video ${hideVideo}`}>
          <span>Guidance Video</span>
          <iframe src={project.video_url} frameBorder="0" allowFullScreen />
        </div>

        <div>
          {steps.map((step, i) => (
            <StepItem
              key={step.id + uniqueId()}
              step={step}
              projectId={project.id}
              count={parseInt(i + 1)}
              author={user}
              currentUser={this.props.currentUser}
              removeStep={this.props.removeStep}
            />
          ))}
        </div>

        <div>{this.displayButton('new', user.id)}</div>

        <CommentShowContainer />
      </div>
    );
  }
}

export default ProjectShow;
