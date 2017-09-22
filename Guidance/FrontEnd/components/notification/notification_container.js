import { connect } from 'react-redux';

import Notification from './notification';

const mapStateToProps = state => {
  let errors = [];
  if (state.errors.session.length > 0) errors = state.errors.session;

  return {
    errors
  };
};

export default connect(mapStateToProps, null)(Notification);
