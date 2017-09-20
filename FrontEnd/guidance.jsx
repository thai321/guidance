import React from 'react';
import ReactDOM from 'react-dom';

import configureStore from './store/store';

import Root from './components/root';

import * as SessionUtil from './util/session_api_util';
import * as ProjectUtil from './util/project_api_util';

import * as SessionActions from './actions/session_actions';
import * as ProjectActions from './actions/project_actions';

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

  window.SessionActions = SessionActions;
  window.ProjectActions = ProjectActions;

  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});
