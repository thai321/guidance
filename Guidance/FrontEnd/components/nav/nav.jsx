import React from 'react';

import { Link } from 'react-router-dom';

import SessionButtonsContainer from '../session_buttons/session_buttons_container';

class Nav extends React.Component {
  constructor(props) {
    super(props);
  }

  displayNewProjectButton() {
    if (this.props.currentUser) {
      return (
        <div className="new-project-button">
          <Link to="/projects/new" className="btn btn-outline-success btn-lg">
            New Project
          </Link>
        </div>
      );
    }
  }

  render() {
    const { currentUser } = this.props;

    return (
      <nav className="nav-home">
        <Link to="/">
          <h1>Guidance App</h1>
        </Link>

        {this.displayNewProjectButton()}

        <SessionButtonsContainer />
      </nav>
    );
  }
}

export default Nav;
