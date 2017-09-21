import React from 'react';
import { Link } from 'react-router-dom';

class ProjectShow extends React.Component {
  componentDidMount() {
    this.props.fetchProject(this.props.match.params.projectId);
  }

  componentWillReceiveProps(nextProps) {
    const currentId = this.props.match.params.projectId;
    const nextId = nextProps.match.params.projectId;
    if (currentId !== nextId) this.props.fetchProject(nextId);
  }

  render() {
    const { project } = this.props;
    if (!project) {
      return <div>Loading...</div>;
    }

    return (
      <div className="project-show">
        <Link className="project-show-back-to-index" to="/">
          <i className="fa fa-home fa-lg" />
        </Link>
        <img
          className="project-show-img"
          src="https://frontside.io/blog/2016/12/15/building-infinite-scroll-in-react-native/react-native-header.jpg"
        />

        <h1 className="project-show-title">{project.title}</h1>

        <div className="project-show-description">
          <h2>Description</h2>
          <p>
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
