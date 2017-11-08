import React from 'react';
import { includes } from 'lodash';

import ProjectIndexItem from './project_index_item';

import { uniqueId } from '../../util/id_generator';

class ProjectIndex extends React.Component {
  constructor(props) {
    super(props);

    this.state = { inputVal: '' };
    this.handleInput = this.handleInput.bind(this);
  }

  handleInput(event) {
    this.setState({ inputVal: event.target.value });
  }

  componentDidMount() {
    this.props.fetchProjects();
  }

  findProject() {
    if (this.state.inputVal.trim().length === 0) return this.props.projects;

    const result = [];

    const subNameSearch = this.state.inputVal.toLowerCase();
    this.props.projects.forEach(project => {
      const name = project.title.toLowerCase();
      if (includes(name, subNameSearch)) result.push(project);
    });

    return result;
  }

  render() {
    return (
      <div className="project-index">
        <div className="container">
          <h3 className="intro">
            Guidance specializes in user-created do-it-yourself projects.
          </h3>
          <div className="projects-searchBar">
            <div className="col-md-6">
              <input
                type="text"
                className="form-control"
                value={this.state.inputVal}
                onChange={this.handleInput}
                placeholder={`\uf002 Let's Make ...`}
              />
            </div>
          </div>

          <div className="row text-center text-lg-left">
            {this.findProject().map((project, idx) => {
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

export default ProjectIndex;
