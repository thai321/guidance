import React from 'react';
import { Route, Link, Switch } from 'react-router-dom';

import { AuthRoute, ProtectedRoute } from '../util/route_util';

import SessionButtonsContainer from './session_buttons/session_buttons_container';
import SessionFormContainer from './session_form/session_form_container';

import ProjectIndexContainer from './project_index/project_index_container';
import ProjectShowContainer from './project_show/project_show_container';

const App = () => (
  <div>
    <header>
      <Link to="/">
        <h1>Guidance App</h1>
      </Link>
      <SessionButtonsContainer />
    </header>

    <AuthRoute path="/login" component={SessionFormContainer} />
    <AuthRoute path="/signup" component={SessionFormContainer} />

    <Switch>
      <Route exact path="/" component={ProjectIndexContainer} />
      <Route
        exact
        path="/projects/:projectId"
        component={ProjectShowContainer}
      />
    </Switch>
  </div>
);

export default App;
