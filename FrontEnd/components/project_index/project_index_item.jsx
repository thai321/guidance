import React from 'react';
import { Link, withRouter } from 'react-router-dom';

const ProjectIndexItem = ({ project }) => {
  const { title, description, image_url, author_id, currentUser } = project;

  return (
    <div className="col col-md-3">
      <li>
        <Link to={`/projects/${project.id}`}>
          <h2>{image_url}</h2>
          <img src="http://r.ddmcdn.com/s_f/o_1/cx_462/cy_245/cw_1349/ch_1349/w_720/APL/uploads/2015/06/caturday-shutterstock_149320799.jpg" />
          <h3>
            {title} By {author_id}
          </h3>
        </Link>
      </li>
    </div>
  );
};

export default ProjectIndexItem;
