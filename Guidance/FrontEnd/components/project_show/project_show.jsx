import React from 'react';
import { Link } from 'react-router-dom';

import Renderers from 'quilljs-renderer';

class ProjectShow extends React.Component {
  constructor(props) {
    super(props);

    this.state = { user: null };

    const Document = Renderers.Document;
    Renderers.loadFormat('html');
  }

  componentWillMount() {
    const { projectId } = this.props.match.params;
    this.props.fetchProject(projectId).then(project => {
      this.props.fetchUser(project.project.author_id).then(user => {
        this.setState({ user: user.user });
      });
    });
  }

  componentWillReceiveProps(nextProps) {
    const currentId = this.props.match.params.projectId;
    const nextId = nextProps.match.params.projectId;
    if (currentId !== nextId) this.props.fetchProject(nextId);
  }

  test() {
    document.querySelector('test').innerHTML;
  }

  render() {
    // debugger;
    const { project } = this.props;
    const { user } = this.state;
    if (!project || !user) {
      return <div>Loading...</div>;
    }
    // console.log(this.state);
    console.log(user);

    return (
      <div className="project-show">
        <Link className="project-show-back-to-index" to="/">
          <i className="fa fa-home fa-lg" />
        </Link>
        <label>
          <Link className="btn btn-info btn-lg" to={`/users/${user.id}`}>
            {user.username}
          </Link>
        </label>
        <img className="project-show-img" src={project.image_url} />

        <h1 className="project-show-title">{project.title}</h1>

        <div className="project-show-description">
          <h2>Description</h2>
          <p className="tests">
            {
              project.description
            }sdjfosjdfojsodfjosdjfosjdfojsodfjosdjfosjdfojsodfjosdjfosjdfojsodfjo
            sdjfosjdfojsodfjo sdjfosjdfojsodfjo
            sdjfosjdfojsodfjosdjfosjdfojsodfjosdjfosjdfojsodfjosdjfosjdfojsodfjo
            sdjfosjdfojsodfjosdjfosjdfojsodfjosdjfosjdfojsodfjosdjfosjdfojsodfjo
            sdjfosjdfojsodfjosdjfosjdfojsodfjosdjfosjdfojsodfjosdjfosjdfojsodfjo
          </p>
        </div>
      </div>
    );
  }
}

export default ProjectShow;
