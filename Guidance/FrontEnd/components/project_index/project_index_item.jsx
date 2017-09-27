import React from 'react';
import { Link, withRouter } from 'react-router-dom';

// const ProjectIndexItem = ({ project }) => {
class ProjectIndexItem extends React.Component {
  displayAuthor() {
    if (!this.props.match.params.userId) {
      const { author_id } = this.props.project;
      return (
        <Link to={`/users/${author_id}`} className="btn btn-warning btn-block">
          Author Information
        </Link>
      );
    }
  }

  displayEdit() {
    const { currentUser } = this.props;
    const { author_id } = this.props.project;
    const currentPath = this.props.match.path;
    if (
      currentUser &&
      currentPath === '/users/:userId' &&
      currentUser.id === author_id
    ) {
      const { id } = this.props.project;
      return (
        <Link to={`/projects/${id}/edit`} className="btn btn-warning btn-block">
          {'Edit This Project'}
        </Link>
      );
    }
  }

  render() {
    const {
      id,
      title,
      description,
      image_url,
      author_id,
      author,
      favorite_users
    } = this.props.project;

    return (
      <div className="col col-md-3 col-xs-12">
        <div className="d-block mb-4 h-100">
          <div className="image-border">
            <div className="image-frame-responsive">
              <img className="img-fluid" src={image_url} />
            </div>
          </div>
          <span className="project-index-title">{title}</span>
          <div className="project-footer">
            <h6>
              {favorite_users.length}
              {favorite_users.length === 0 ? (
                <i className="fa fa-heart-o" aria-hidden="true" />
              ) : (
                <i className="fa fa-heart" aria-hidden="true" />
              )}
            </h6>

            <h6>by {author}</h6>
          </div>
          <p>
            <Link to={`/projects/${id}`} className="btn btn-info btn-block">
              Project Information
            </Link>

            {this.displayAuthor()}
            {this.displayEdit()}
          </p>
        </div>
      </div>
    );
  }
}
export default withRouter(ProjectIndexItem);
