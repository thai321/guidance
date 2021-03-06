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

    this.handleSubmit = this.handleSubmit.bind(this);
    this.loginDemo = this.loginDemo.bind(this);
    this.clear = this.clear.bind(this);
  }

  componentWillReceiveProps(nextProps) {
    if (nextProps.loggedIn) return this.props.history.push('/');
  }

  update(type) {
    return e =>
      this.setState({
        [type]: e.currentTarget.value
      });
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

  loginDemo() {
    const user = Object.assign({}, this.state);
    this.props.processForm(user).then(() => this.props.history.push('/'));
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user).then(() => this.props.history.push('/'));
  }

  displayEmail() {
    if (this.props.formType === 'signup') {
      return (
        <div className="form-group">
          <label
            className="col-md-6 control-label session-font-input"
            htmlFor="email"
          >
            Email
          </label>
          <div className="col-md-12">
            <input
              type="email"
              placeholder="&#xf003; thainguyen@berkeley.edu"
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
          <div className="index-img">
            <img src="https://cmkt-image-prd.global.ssl.fastly.net/0.1.0/ps/2680043/580/386/m1/fpnw/wm0/timeline-paper-style-design-4-steps-converted-01-.jpg?1494624097&s=7c44b2e5a795f5b5a65b0eb0116bb280" />
          </div>

          <form className="form-horizontal session-form">
            <label className="text-session session-text-header">{text}</label>

            <div className="form-group">
              <label className="col-md-6 control-label session-font-input">
                User Name
              </label>

              <div className="col-md-12">
                <input
                  type="text"
                  placeholder="&#xf007; thainguyen"
                  className="form-control input-md"
                  required=""
                  value={this.state.username}
                  onChange={this.update('username')}
                />
              </div>
            </div>

            {this.displayEmail()}

            <div className="form-group">
              <label
                className="col-md-6 control-label session-font-input"
                htmlFor="password"
              >
                Password
              </label>
              <div className="col-md-12">
                <input
                  type="password"
                  placeholder="&#xf084;"
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
                    onClick={this.handleSubmit}
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
