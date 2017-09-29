import { connect } from 'react-redux';

import { fetchTags } from '../../actions/tag_actions';

import NavLink from './nav_link';

const mapStateToProps = state => {
  return {
    tags: Object.values(state.entities.tags)
  };
};

const mapDispatchToProps = dispatch => {
  return {
    fetchTags: () => dispatch(fetchTags())
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(NavLink);
