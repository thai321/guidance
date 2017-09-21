import React from 'react';
import { Link } from 'react-router-dom';

// import { projectByIds } from '../../reducers/selectors';

class UserShow extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props
      .fetchUser(this.props.match.params.userId)
      .then(this.props.fetchProjects());
  }

  render() {
    if (!this.props.user) {
      return (
        <div>
          <h1>Loading...</h1>
        </div>
      );
    } else {
      const { user } = this.props;

      return (
        <div>
          <h1>User Show Page</h1>
          {this.props.projectsByUser.map(project => <h1>{project.title}</h1>)}
        </div>
      );
    }
  }
}

export default UserShow;
