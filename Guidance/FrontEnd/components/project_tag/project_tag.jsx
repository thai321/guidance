import React from 'react';

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
      this.props.fetchProjects(nextTag);
    }
  }

  render() {
    return (
      <div>
        <h1>Project Tag Page</h1>
      </div>
    );
  }
}

export default ProjectTag;
