import React from 'react';
import { Link } from 'react-router-dom';

const SessionForm = ({ currentUser, login, logout }) =>
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
    <div>
      <ul className="navbar-nav ml-auto">
        <li className="nav-item">
          <button
            className="btn btn-outline-info"
            onClick={login.bind(this, {
              username: 'ThaiNguyen',
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

// <li className="nav-item">
//   <button
//     className="btn btn-outline-info"
//     onClick={login.bind(this, {
//       username: 'ThaiNguyen',
//       password: '123456'
//     })}
//   >
//     Demo
//   </button>
// </li>
//
// <li className="nav-item">
//   <Link className="btn btn-outline-primary" to="/signup">
//     Signup
//   </Link>
// </li>
//
// <li className="nav-item">
//   <Link className="btn btn-outline-success" to="/login">
//     Login
//   </Link>
// </li>
