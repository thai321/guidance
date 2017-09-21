import React from 'react';
import { Route, Link, Switch } from 'react-router-dom';

import { AuthRoute, ProtectedRoute } from '../util/route_util';

import NavContainer from './nav/nav_container';

import SessionFormContainer from './session_form/session_form_container';

import ProjectIndexContainer from './project_index/project_index_container';
import ProjectShowContainer from './project_show/project_show_container';
import ProjectFormContainer from './project_form/project_form_container';
import UserIndexContainer from './user_index/user_index_container';

const App = () => (
  // const {state} =
  // console.log(this.props);
  // class App extends React.Component {
  //   constructor(props) {
  //     super(props);
  //   }

  // render() {
  // console.log(this.props);
  // return (
  <div className="app">
    <NavContainer />

    <div className="main-app">
      <AuthRoute path="/login" component={SessionFormContainer} />
      <AuthRoute path="/signup" component={SessionFormContainer} />

      <Switch>
        <Route exact path="/" component={ProjectIndexContainer} />
        <Route path="/projects/new" component={ProjectFormContainer} />
        <Route
          exact
          path="/projects/:projectId"
          component={ProjectShowContainer}
        />
        <Route
          path="/projects/:projectId/edit"
          component={ProjectFormContainer}
        />
      </Switch>

      <Switch>
        <Route path="/users" component={UserIndexContainer} />
      </Switch>
    </div>
  </div>
);

// )

export default App;
