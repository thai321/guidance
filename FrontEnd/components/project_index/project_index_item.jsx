import React from 'react';
import { Link, withRouter } from 'react-router-dom';

const ProjectIndexItem = ({ project }) => {
  const { title, description, image_url, author_id, currentUser } = project;

  return (
    <div className="col col-md-3">
      <div className="thumbnail">
        <img src="http://r.ddmcdn.com/s_f/o_1/cx_462/cy_245/cw_1349/ch_1349/w_720/APL/uploads/2015/06/caturday-shutterstock_149320799.jpg" />
        <div className="caption">
          <h3>{title}</h3>
          <h5>by {author_id}</h5>

          <p>
            <Link
              to={`/projects/${project.id}`}
              className="btn btn-info btn-block"
            >
              View
            </Link>
          </p>
        </div>
      </div>
    </div>
  );
};

export default ProjectIndexItem;
