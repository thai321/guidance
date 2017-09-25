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
            Write a Guidance
          </Link>
        </div>
      );
    }
  }

  render() {
    const { currentUser } = this.props;

    return (
      <div>
        <nav className="navbar navbar-expand-lg fixed-top" id="mainNav">
          <div className="container">
            <Link to="/" className="navbar-brand">
              Guidance App
            </Link>
            <Link to="/users" className="all-teachers">
              Teachers
            </Link>

            <div className="col-md-6">
              <form className="navbar-form" role="search">
                <div className="input-group">
                  <input
                    type="text"
                    className="form-control"
                    placeholder="Let's Make ..."
                  />
                </div>
              </form>
            </div>
          </div>

          {this.displayNewProjectButton()}
          <SessionButtonsContainer />
        </nav>
      </div>
    );
  }
}

export default Nav;
