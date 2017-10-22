import React from 'react';

import { Link } from 'react-router-dom';

class Footer extends React.Component {
  render() {
    return (
      <nav className="navbar navbar-expand-lg navbar-dark bg-dark">
        <div className="container">
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
              <li className="nav-item">
                <a
                  className="nav-link btn btn-outline-success"
                  href="https://www.github.com/thai321/guidance"
                >
                  Source
                </a>
              </li>

              <li className="nav-item">
                <a
                  className="nav-link btn btn-outline-primary"
                  href="https://www.github.com/thai321"
                >
                  Github
                </a>
              </li>

              <li className="nav-item">
                <a
                  className="nav-link btn btn-outline-warning"
                  href="https://www.linkedin.com/in/thai-nguyen91/"
                >
                  Linkedin
                </a>
              </li>

              <li className="nav-item">
                <a
                  className="nav-link btn btn-outline-info"
                  href="http://www.qthai.me/"
                >
                  Thai Nguyen
                </a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    );
  }
}

export default Footer;
