import React from 'react';
import { withRouter } from 'react-router-dom';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      username: '',
      password: ''
    };

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
            <input className="btn btn-primary" type="submit" value="Submit" />
          </label>
        </form>
      </div>
    );
  }
}

export default withRouter(SessionForm);
