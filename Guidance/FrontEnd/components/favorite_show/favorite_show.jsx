import React from 'react';
import { Link } from 'react-router-dom';

import { uniqueId } from '../../util/id_generator';

import ProjectIndexItem from '../project_index/project_index_item';

class FavoriteShow extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchFavoriteProjects(this.props.user.favorite_projects);
  }

  componentWillReceiveProps(nextProps) {
    const oldId = this.props.user.id;
    const newId = nextProps.user.id;

    if (oldId !== newId) {
      this.props.fetchFavoriteProjects(nextProps.user.favorite_projects);
    }
  }

  render() {
    const { user, favorites } = this.props;

    if (!user) {
      return <div className="loader" />;
    } else {
      return (
        <div className="row">
          {favorites.map((project, i) => {
            return (
              <ProjectIndexItem
                key={
                  project.id + project.title + this.props.user.id + uniqueId()
                }
                project={project}
                currentUser={this.props.currentUser}
              />
            );
          })}
        </div>
      );
    }
  }
}

export default FavoriteShow;
