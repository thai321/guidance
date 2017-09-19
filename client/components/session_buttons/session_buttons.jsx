import React from 'react';
import { Link } from 'react-router-dom';

const SessionForm = ({ currentUser, logout }) =>
  currentUser ? (
    <div className="welcome">
      <h1>Welcome {currentUser.username}</h1>
      <button onClick={logout}>Log Out</button>
    </div>
  ) : (
    <ul className="login">
      <li>
        <Link to="/signup">Signup</Link>
      </li>
      <li>
        <Link to="/login">Login</Link>
      </li>
    </ul>
  );

export default SessionForm;
