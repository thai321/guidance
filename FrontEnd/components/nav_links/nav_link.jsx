import React from 'react';
import { Link } from 'react-router-dom';

class NavLink extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchTags();
  }

  render() {
    return (
      <nav className="navbar navbar-custom">
        <div className="navbar-custom-links">
          <Link to="/users" className="">
            All Teachers
          </Link>
          <Link to="/" className="">
            Guidance App
          </Link>
        </div>
      </nav>
    );
  }
}

export default NavLink;
