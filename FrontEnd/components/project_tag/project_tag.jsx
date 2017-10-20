import React from 'react';
import { uniqueId } from '../../util/id_generator';

import ProjectIndexItem from '../project_index/project_index_item';

class ProjectTag extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchTagProjects(this.props.match.params.name);
  }

  componentWillReceiveProps(nextProps) {
    const currentTag = this.props.match.params.name;
    const nextTag = nextProps.match.params.name;

    if (nextTag !== currentTag) {
      this.props.fetchTagProjects(nextTag);
    }
  }

  render() {
    return (
      <div className="project-index project-tag">
        <span className="project-tag-name">{this.props.tagName}</span>
        <div className="container">
          <div className="row text-center text-lg-left">
            {this.props.projects.map((project, idx) => {
              return (
                <ProjectIndexItem
                  key={project.id + project.title + idx + uniqueId()}
                  project={project}
                  currentUser={this.props.currentUser}
                />
              );
            })}
          </div>
        </div>
      </div>
    );
  }
}

export default ProjectTag;
