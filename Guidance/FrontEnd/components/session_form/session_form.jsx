import React from 'react';
import { withRouter } from 'react-router-dom';

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
  }

  handleSumbit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    console.log(user);
    this.props.processForm(user).then(() => this.props.history.push('/'));
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

  displayEmail() {
    if (this.props.formType === 'signup') {
      return (
        <div>
          <br />
          <label>
            Email:
            <input
              type="text"
              value={this.state.email}
              onChange={this.update('email')}
            />
          </label>
        </div>
      );
    }
  }

  render() {
    return (
      <div>
        {this.displayErrors()}
        <form onSubmit={this.handleSumbit}>
          Welcome to BenchBnB!
          <br />
          {this.props.formType} Page
          <br />
          <label>
            Username:
            <input
              type="text"
              value={this.state.username}
              onChange={this.update('username')}
            />
          </label>
          {this.displayEmail()}
          <br />
          <label>
            Password
            <input
              type="password"
              value={this.state.password}
              onChange={this.update('password')}
            />
            <label />
            <br />
            <div className="submitLogin">
              <input
                className="btn btn-lg btn-outline-primary"
                type="submit"
                value="Submit"
              />
            </div>
          </label>
        </form>
      </div>
    );
  }
}

export default withRouter(SessionForm);
