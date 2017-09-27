import React from 'react';

import { Link, withRouter } from 'react-router-dom';

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
    const { currentUser, location } = this.props;
    const text = "Let's Make ...";

    return (
      <div>
        <nav className="navbar navbar-expand-lg fixed-top" id="mainNav">
          <Link to="/" className="navbar-brand">
            <img src="https://learningpolicyinstitute.org/sites/all/themes/lpi2016/images/large-external-link-icon.svg" />
            <span>Guidance App</span>
          </Link>
          <div className="container">
            <Link to="/users" className="all-teachers">
              Teachers
            </Link>

            <div className="col-md-6">
              <form className="navbar-form" role="search">
                <div className="input-group">
                  <input
                    type="text"
                    className="form-control"
                    placeholder={`\uf002 ${text}`}
                  />
                </div>
              </form>
            </div>
            {this.displayNewProjectButton()}
          </div>

          <SessionButtonsContainer />
        </nav>
      </div>
    );
  }
}

export default withRouter(Nav);
