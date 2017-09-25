import React from 'react';
import { Link } from 'react-router-dom';

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
        <div>
          {favorites.map((project, i) => {
            return <h2 key={i}>{project.title}</h2>;
          })}
        </div>
      );
    }
  }
}

export default FavoriteShow;
