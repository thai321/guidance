import React from 'react';

import UserIndexItem from './user_index_item';

import { uniqueId } from '../../util/id_generator';

class UserIndex extends React.Component {
  constructor(props) {
    super(props);

    this.state = { inputVal: '' };
    this.handleInput = this.handleInput.bind(this);
  }

  handleInput(event) {
    this.setState({ inputVal: event.target.value });
  }

  componentDidMount() {
    this.props.fetchUsers();
  }

  findUser() {
    if (this.state.inputVal.trim().length === 0) return this.props.users;

    const result = [];

    const subNameSearch = this.state.inputVal.toLowerCase();
    this.props.users.forEach(user => {
      const name = user.username.toLowerCase();
      if (name.includes(subNameSearch)) result.push(user);
    });

    return result;
  }

  render() {
    if (!this.props.users) {
      return <div className="loader" />;
    }

    return (
      <div className="user-index-page">
        <div className="container">
          <div className="users-searchBar">
            <div className="col-md-6">
              <input
                type="text"
                className="form-control"
                value={this.state.inputVal}
                onChange={this.handleInput}
                placeholder={`\uf002 Find a Teacher`}
              />
            </div>
          </div>
          <div className="row text-center text-lg-left">
            {this.findUser().map((user, idx) => {
              return (
                <UserIndexItem key={user.id + idx + uniqueId()} user={user} />
              );
            })}
          </div>
        </div>
      </div>
    );
  }
}

export default UserIndex;
