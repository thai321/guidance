import React from 'react';
import { Link, withRouter } from 'react-router-dom';

const ProjectIndexItem = ({ project }) => {
  const { title, description } = project;
  return (
    <div className="col-md-3">
      <li>
        <Link to={`/projects/${project.id}`}>
          <h1>{title}</h1>
        </Link>
        <h2>{description}</h2>

        <Link to={`/projects/${project.id}/edit`}>
          <h1>Edit</h1>
        </Link>
      </li>
    </div>
  );
};

export default ProjectIndexItem;
