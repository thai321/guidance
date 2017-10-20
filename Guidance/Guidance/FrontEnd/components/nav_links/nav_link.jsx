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
          <Link to="/users">All Teachers</Link>

          <Link to="/tags/Arduino">Arduino</Link>

          <Link to="/tags/Math">Math</Link>

          <Link to="/tags/Computer%20Science">Computer Science</Link>

          <Link to="/tags/Music">Music</Link>

          <Link to="/tags/Other">Other</Link>
        </div>
      </nav>
    );
  }
}

export default NavLink;
