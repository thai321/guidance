import { connect } from 'react-redux';

import { withRouter } from 'react-router-dom';

import Nav from './nav';

const mapStateToProps = (state, ownProps) => {
  return {
    currentUser: state.session.currentUser
  };
};

export default withRouter(connect(mapStateToProps, null)(Nav));
