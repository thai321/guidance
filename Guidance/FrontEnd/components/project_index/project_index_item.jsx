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
      author
    } = this.props.project;

    return (
      <div className="col col-md-3 col-xs-12">
        <div className="">
          <div className="thumbnail">
            <img className="img-fluid" src={image_url} />
            <div className="">
              <h4>{title}</h4>
              <h4>by {author}</h4>
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
      </div>
    );
  }
}
export default withRouter(ProjectIndexItem);
