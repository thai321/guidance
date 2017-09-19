import { connect } from 'react-redux';

import { login, logout, signup } from '../../actions/session_actions';
import SessionForm from './session_form';

const mapStateToProps = state => {
  const loggedIn = Boolean(state.session.currentUser);
  const errors = state.errors.session;

  return {
    loggedIn,
    errors
  };
};

const mapDispatchToProps = (dispatch, { location }) => {
  const formType = location.pathname.slice(1);
  const processForm = formType === 'login' ? login : signup;
  return {
    processForm: user => dispatch(processForm(user)),
    // login: user => dispatch(login(user)),
    // signup: user => dispatch(signup(user)),
    formType
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);
