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
          <label className="col-md-6 control-label" htmlFor="email">
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
            <img src="http://r.ddmcdn.com/s_f/o_1/cx_462/cy_245/cw_1349/ch_1349/w_720/APL/uploads/2015/06/caturday-shutterstock_149320799.jpg" />
          </div>

          <form className="form-horizontal session-form">
            <legend className="text-session">{text}</legend>

            <div className="form-group">
              <label className="col-md-6 control-label">User Name</label>

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
              <label className="col-md-6 control-label" htmlFor="password">
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
