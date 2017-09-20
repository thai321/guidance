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
      <div>
        <h1>TESETSETEST</h1>
        <h1>{project.title}</h1>
        <h1>{project.description}</h1>
        <Link to="/">Back to Index</Link>
      </div>
    );
  }
}

export default ProjectShow;
