import { connect } from 'react-redux';

import { login, logout, signup } from '../../actions/session_actions';

import { withRouter } from 'react-router-dom';

import SessionForm from './session_form';

const mapStateToProps = (state, ownProps) => {
  const loggedIn = Boolean(state.session.currentUser);
  const errors = state.errors.session;

  return {
    loggedIn,
    errors
  };
};

const mapDispatchToProps = (dispatch, { location }) => {
  const formType = location.pathname.slice(1);
  const processForm = formType === 'signup' ? signup : login;

  const demo = location.pathname === '/demo' ? true : false;

  return {
    processForm: user => dispatch(processForm(user)),
    // login: user => dispatch(login(user)),
    // signup: user => dispatch(signup(user)),
    formType,
    demo
  };
};

export default withRouter(
  connect(mapStateToProps, mapDispatchToProps)(SessionForm)
);
