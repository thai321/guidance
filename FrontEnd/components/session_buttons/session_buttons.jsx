import React from 'react';
import { Link } from 'react-router-dom';

const SessionForm = ({ currentUser, logout }) =>
  currentUser ? (
    <div className="welcome">
      <h1>Welcome {currentUser.username}</h1>
      <div className="session-form-login-button">
        <button className="btn btn-sm btn-outline-danger" onClick={logout}>
          Log Out
        </button>
      </div>
    </div>
  ) : (
    <ul className="login">
      <li>
        <Link className="btn btn-outline-primary" to="/signup">
          Signup
        </Link>
      </li>
      <li>
        <Link className="btn btn-outline-success" to="/login">
          Login
        </Link>
      </li>
    </ul>
  );

export default SessionForm;
