import React from 'react';

import ProjectIndexItem from './project_index_item';

class ProjectIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchProjects();
  }

  render() {
    return (
      <div className="container-fluid">
        <div className="row">
          {this.props.projectIds.map(id => {
            const project = this.props.projects[id];

            return <ProjectIndexItem key={project.title} project={project} />;
          })}
        </div>
      </div>
    );
  }
}

export default ProjectIndex;
