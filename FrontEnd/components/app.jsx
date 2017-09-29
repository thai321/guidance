import React from 'react';
import { Route, Link, Switch } from 'react-router-dom';

import { AuthRoute, ProtectedRoute } from '../util/route_util';

import NavContainer from './nav/nav_container';
import NavLinkContainer from './nav_links/nav_link_container';

import SessionFormContainer from './session_form/session_form_container';

import ProjectIndexContainer from './project_index/project_index_container';
import ProjectShowContainer from './project_show/project_show_container';
import ProjectFormContainer from './project_form/project_form_container';

import StepFormContainer from './step_form/step_form_container';

import UserIndexContainer from './user_index/user_index_container';
import UserShowContainer from './user_show/user_show_container';

import NotificationContainer from './notification/notification_container';

const App = () => (
  <div>
    <NotificationContainer />
    <NavContainer />

    <NavLinkContainer />

    <div className="app">
      <div className="main-app">
        <AuthRoute path="/login" component={SessionFormContainer} />
        <AuthRoute path="/demo" component={SessionFormContainer} />
        <AuthRoute path="/signup" component={SessionFormContainer} />

        <Switch>
          <Route exact path={`/`} component={ProjectIndexContainer} />
          {/*<Route
            exact
            path={`/tags/:tagName`}
            component={TagProjectIndexContainer}
          /> */}
          <ProtectedRoute
            path="/projects/new"
            component={ProjectFormContainer}
          />
          <Route
            exact
            path="/projects/:projectId"
            component={ProjectShowContainer}
          />
          <ProtectedRoute
            path="/projects/:projectId/edit"
            component={ProjectFormContainer}
          />

          <ProtectedRoute
            path="/projects/:projectId/steps/new"
            component={StepFormContainer}
          />

          <ProtectedRoute
            path="/projects/:projectId/steps/:stepId/edit"
            component={StepFormContainer}
          />

          <Route exact path="/users" component={UserIndexContainer} />
          <Route exact path="/users/:userId" component={UserShowContainer} />
        </Switch>
      </div>
    </div>
  </div>
);

export default App;
