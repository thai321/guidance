import React from 'react';
import { Link } from 'react-router-dom';

import { uniqueId } from '../../util/id_generator';

import ProjectIndexItem from '../project_index/project_index_item';

class FavoriteShow extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { user, favorites } = this.props;

    if (!user || !favorites) {
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
