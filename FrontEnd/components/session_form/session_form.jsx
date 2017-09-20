import React from 'react';

import { withRouter } from 'react-router-dom';

import ProjectIndexContainer from '../project_index/project_index_container';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);

    if (this.props.formType === 'signup') {
      this.state = {
        username: '',
        email: '',
        password: ''
      };
    } else {
      this.state = {
        username: '',
        password: ''
      };
    }

    this.handleSumbit = this.handleSumbit.bind(this);
    this.clear = this.clear.bind(this);
  }

  componentWillReceiveProps(nextProps) {
    console.log(nextProps.loggedIn);
    if (nextProps.loggedIn) return this.props.history.push('/');
  }

  update(type) {
    return e =>
      this.setState({
        [type]: e.currentTarget.value
      });
  }

  displayErrors() {
    return (
      <ul>
        {this.props.errors.map((error, i) => (
          <li key={`error-${i}`}>{error}</li>
        ))}
      </ul>
    );
  }

  clear(e) {
    e.preventDefault();

    const form =
      this.props.formType === 'signup'
        ? {
            username: '',
            email: '',
            password: ''
          }
        : {
            username: '',
            password: ''
          };
    this.setState(form);
  }

  handleSumbit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user).then(() => this.props.history.push('/'));
  }

  displayEmail() {
    if (this.props.formType === 'signup') {
      return (
        <div className="form-group">
          <label className="col-md-6 control-label" htmlFor="email">
            Email
          </label>
          <div className="col-md-12">
            <input
              type="email"
              placeholder="name@example.com"
              className="form-control input-md"
              required=""
              value={this.state.email}
              onChange={this.update('email')}
            />
          </div>
        </div>
      );
    }
  }

  render() {
    const text =
      this.props.formType === 'signup' ? 'Register Yourself' : 'Please Login';

    const buttonName =
      this.props.formType === 'signup' ? 'Register' : 'Sign In';
    return (
      <div>
        <div className="main-index">
          {this.displayErrors()}

          <div className="index-img">
            <p>hello</p>
          </div>

          <form className="form-horizontal session-form">
            <legend className="text-session">{text}</legend>

            <div className="form-group">
              <label className="col-md-6 control-label">User Name</label>
              <div className="col-md-12">
                <input
                  type="text"
                  placeholder="Your Name"
                  className="form-control input-md"
                  required=""
                  value={this.state.username}
                  onChange={this.update('username')}
                />
              </div>
            </div>

            {this.displayEmail()}

            <div className="form-group">
              <label className="col-md-6 control-label" htmlFor="password">
                Password
              </label>
              <div className="col-md-12">
                <input
                  type="password"
                  placeholder=""
                  className="form-control input-md"
                  required=""
                  value={this.state.password}
                  onChange={this.update('password')}
                />
              </div>
            </div>

            <div className="form-group">
              <div className="col-md-6">
                <div className="session-buttons">
                  <button
                    onClick={this.handleSumbit}
                    className="btn btn-success"
                  >
                    {buttonName}
                  </button>

                  <button onClick={this.clear} className="btn btn-danger">
                    Reset
                  </button>
                </div>
              </div>
            </div>
          </form>
        </div>
        <br />

        <ProjectIndexContainer />
      </div>
    );
  }
}

export default withRouter(SessionForm);
