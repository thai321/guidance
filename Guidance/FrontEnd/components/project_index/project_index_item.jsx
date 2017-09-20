import React from 'react';
import { Link, withRouter } from 'react-router-dom';

const ProjectIndexItem = ({ project }) => {
  const { title, description } = project;
  return (
    <div>
      <Link to={`/projects/${project.id}`}>
        <li>
          <h1>{title}</h1>
          <h2>{description}</h2>
        </li>
      </Link>
    </div>
  );
};

export default ProjectIndexItem;
