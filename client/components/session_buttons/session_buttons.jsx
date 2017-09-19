import React from 'react';
import { Link } from 'react-router-dom';

const SessionForm = ({ currentUser, logout }) =>
  currentUser ? (
    <div className="welcome">
      <h1>Welcome {currentUser.username}</h1>
      <button className="btn btn-small btn-danger" onClick={logout}>
        Log Out
      </button>
    </div>
  ) : (
    <ul className="login">
      <li>
        <Link className="btn btn-small btn-primary" to="/signup">
          Signup
        </Link>
      </li>
      <li>
        <Link className="btn btn-small btn-primary" to="/login">
          Login
        </Link>
      </li>
    </ul>
  );

export default SessionForm;
