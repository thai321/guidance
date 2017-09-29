import { connect } from 'react-redux';

import { withRouter } from 'react-router-dom';

import { login, logout } from '../../actions/session_actions';

import Nav from './nav';

const mapStateToProps = (state, ownProps) => {
  return {
    currentUser: state.session.currentUser
  };
};

const mapDispatchToProps = dispatch => ({
  logout: () => dispatch(logout()),
  login: user => dispatch(login(user))
});

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Nav));
