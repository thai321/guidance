import React from 'react';
import { Link } from 'react-router-dom';

import { uniqueId } from '../../util/id_generator';

import StepItem from './step_item';

class ProjectShow extends React.Component {
  constructor(props) {
    super(props);

    this.state = { user: null };
  }

  componentDidMount() {
    const { projectId } = this.props.match.params;

    this.props.fetchProject(projectId).then(action => {
      const { project } = action;
      if (project.step_ids.length > 0) {
        this.props.fetchSteps(project.id);
      }

      this.props.fetchUser(project.author_id).then(user => {
        this.setState({ user: user.user });
      });
    });
  }

  componentWillReceiveProps(nextProps) {
    const currentId = this.props.match.params.projectId;
    const nextId = nextProps.match.params.projectId;
    if (currentId !== nextId) this.props.fetchProject(nextId);
  }

  displayButton(type, authorId) {
    const currentUser = this.props.currentUser;

    if (currentUser) {
      if (authorId === currentUser.id) {
        const { projectId } = this.props.match.params;

        if (type === 'new') {
          return (
            <Link
              className="btn btn-lg btn-primary"
              to={`/projects/${projectId}/steps/new`}
            >
              Add Step
            </Link>
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

  render() {
    const { project } = this.props;
    const { user } = this.state;
    if (!project || !user) {
      return <div>Loading...</div>;
    }

    const steps = this.props.steps;

    return (
      <div className="project-show-page">
        <div className="project-show-buttons">
          <Link className="project-show-back-to-index" to="/">
            <i className="fa fa-home fa-2x" />
          </Link>

          <Link className="project-show-back-to-index" to={`/users/${user.id}`}>
            <i className="fa fa-user fa-2x" />
          </Link>

          <div>{this.displayButton('edit', user.id)}</div>
        </div>

        <div className="project-show">
          <h1 className="project-show-title">{project.title}</h1>
          <img className="project-show-img" src={project.image_url} />
        </div>

        <div className="project-show-description">
          <h2>Description</h2>
          <div dangerouslySetInnerHTML={{ __html: project.description }} />
        </div>

        <div className="project-show-video">
          <iframe
            width="560"
            height="315"
            src={project.video_url}
            frameBorder="0"
            allowFullScreen
          />
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
      </div>
    );
  }
}

export default ProjectShow;
