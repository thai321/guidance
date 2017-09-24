import React from 'react';
import ReactDOM from 'react-dom';

import configureStore from './store/store';

import Root from './components/root';

import * as SessionUtil from './util/session_api_util';
import * as ProjectUtil from './util/project_api_util';
import * as UserUtil from './util/user_api_util';
import * as StepUtil from './util/step_api_util';
import * as CommentUtil from './util/comment_api_util';

import * as SessionActions from './actions/session_actions';
import * as ProjectActions from './actions/project_actions';
import * as UserActions from './actions/user_actions';
import * as StepActions from './actions/step_actions';

import * as Selectors from './reducers/selectors';

document.addEventListener('DOMContentLoaded', () => {
  let store;
  if (window.currentUser) {
    const preloadedState = {
      session: { currentUser: window.currentUser }
    };

    store = configureStore(preloadedState);
    delete window.currentUser;
  } else {
    store = configureStore();
  }

  window.getState = store.getState;
  window.dispatch = store.dispatch;

  window.SessionUtil = SessionUtil;
  window.ProjectUtil = ProjectUtil;
  window.UserUtil = UserUtil;
  window.StepUtil = StepUtil;
  window.CommentUtil = CommentUtil;

  window.SessionActions = SessionActions;
  window.ProjectActions = ProjectActions;
  window.UserActions = UserActions;
  window.StepActions = StepActions;

  window.Selectors = Selectors;

  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});
