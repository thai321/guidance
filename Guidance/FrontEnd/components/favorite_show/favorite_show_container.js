import { connect } from 'react-redux';
import { withRouter } from 'react-router-dom';

import { fetchUser } from '../../actions/user_actions';
import { fetchFavoriteProjects } from '../../actions/project_actions';

import FavoriteShow from './favorite_show';

const mapStateToProps = (state, ownProps) => {
  const favorites = [];

  ownProps.user.favorite_projects.forEach(id => {
    if (state.entities.projects[id]) {
      favorites.push(state.entities.projects[id]);
    }
  });

  return {
    user: ownProps.user,
    favorites
  };
};

const mapDispatchToProps = dispatch => {
  return {
    fetchFavoriteProjects: projectIds =>
      dispatch(fetchFavoriteProjects(projectIds))
  };
};

export default withRouter(
  connect(mapStateToProps, mapDispatchToProps)(FavoriteShow)
);
