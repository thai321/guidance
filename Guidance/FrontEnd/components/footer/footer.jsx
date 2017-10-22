import React from 'react';

import { Link } from 'react-router-dom';

class Footer extends React.Component {
  render() {
    return (
      <ul className="footer_container">
        <li className="nav-item">
          <a href="https://github.com/thai321/guidance">
            <i className="fa fa-code-fork fa-4x" aria-hidden="true" />
          </a>
        </li>

        <li className="nav-item">
          <a href="https://github.com/thai321">
            <i className="fa fa-github fa-4x" aria-hidden="true" />
          </a>
        </li>

        <li className="nav-item">
          <a href="https://www.linkedin.com/in/thai-nguyen91/">
            <i className="fa fa-linkedin-square fa-4x" aria-hidden="true" />
          </a>
        </li>

        <li className="nav-item">
          <a href="http://www.qthai.me/">
            <i className="fa fa-user fa-4x" aria-hidden="true" />
          </a>
        </li>
      </ul>
    );
  }
}

export default Footer;
