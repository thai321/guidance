import { connect } from 'react-redux';

import Nav from './nav';

const mapStateToProps = state => {
  // debugger;
  return {
    currentUser: state.session.currentUser
  };
};

export default connect(mapStateToProps, null)(Nav);
