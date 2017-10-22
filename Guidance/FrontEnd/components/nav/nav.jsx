import React from 'react';

import { Link, withRouter } from 'react-router-dom';

class Nav extends React.Component {
  constructor(props) {
    super(props);

    this.state = { inputVal: '' };
  }

  render() {
    const { currentUser, location } = this.props;
    const text = "Let's Make ...";

    const hideLogin = currentUser ? 'none' : '';
    const hideLogout = currentUser ? '' : 'none';

    return (
      <nav className="navbar navbar-expand-lg navbar-dark bg-dark">
        <div className="container">
          <Link to="/" className="navbar-brand">
            <img
              className="d-inline-block align-top"
              src="https://learningpolicyinstitute.org/sites/all/themes/lpi2016/images/large-external-link-icon.svg"
            />
            <span className="nav-logo-name">Guidance App</span>
          </Link>

          <button
            className="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarResponsive"
            aria-controls="navbarResponsive"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span className="navbar-toggler-icon" />
          </button>

          <div className="collapse navbar-collapse" id="navbarResponsive">
            <ul className="navbar-nav ml-auto">
              <button
                className={`btn btn-outline-info ${hideLogin}`}
                onClick={this.props.login.bind(this, {
                  username: 'guest',
                  password: '123456'
                })}
              >
                DEMO
              </button>

              <li className={`nav-item ${hideLogin}`}>
                <Link className="nav-link btn btn-outline-primary" to="/signup">
                  <span>Signup</span>
                </Link>
              </li>
              <li className={`nav-item ${hideLogin}`}>
                <Link className="nav-link btn btn-outline-success" to="/login">
                  Login
                </Link>
              </li>

              <li className="nav-item">
                <Link
                  className={`nav-link btn btn-sm btn-outline-success ${hideLogout}`}
                  to={`/projects/new`}
                >
                  Write a Guidance
                </Link>
              </li>

              <li className="nav-item">
                <Link
                  className={`nav-link btn btn-sm btn-outline-info dash-board ${hideLogout}`}
                  to={currentUser ? `/users/${currentUser.id}` : '/'}
                >
                  Dash Board
                </Link>
              </li>

              <button
                className={`btn btn-outline-danger ${hideLogout}`}
                onClick={this.props.logout}
              >
                Log Out
              </button>

              <div className={`welcome-user-name-image ${hideLogout}`}>
                <Link to={currentUser ? `/users/${currentUser.id}` : '/'}>
                  <span>
                    Welcome {currentUser ? currentUser.username : ''}{' '}
                  </span>
                  <img src={currentUser ? currentUser.image_url : '/'} />
                </Link>
              </div>
            </ul>
          </div>
        </div>
      </nav>
    );
  }
}

export default withRouter(Nav);
