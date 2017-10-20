import React from 'react';
import { Link } from 'react-router-dom';

const SessionForm = ({ currentUser, login, logout }) =>
  currentUser ? (
    <div className="welcome">
      <div className="welcome-user-name-image">
        <img src={currentUser.image_url} />
        <span>Welcome {currentUser.username}</span>
      </div>
      <div className="session-form-login-button">
        <Link
          className="btn btn-sm btn-outline-info"
          to={`/users/${currentUser.id}`}
        >
          Dash Board
        </Link>

        <button className="btn btn-sm btn-outline-danger" onClick={logout}>
          Log Out
        </button>
      </div>
    </div>
  ) : (
    <div>
      <ul className="navbar-nav ml-auto">
        <li className="nav-item">
          <button
            className="btn btn-outline-info"
            onClick={login.bind(this, {
              username: 'guest',
              password: '123456'
            })}
          >
            DEMO
          </button>
        </li>

        <li className="nav-item">
          <Link className="btn btn-outline-primary" to="/signup">
            Signup
          </Link>
        </li>

        <li className="nav-item">
          <Link className="btn btn-outline-success" to="/login">
            Login
          </Link>
        </li>
      </ul>
    </div>
  );

export default SessionForm;
