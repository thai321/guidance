import React from 'react';
import { Provider } from 'react-redux';
import { HashRouter } from 'react-router-dom';

import App from './app';

import Footer from './footer/footer';

const Root = ({ store }) => (
  <div>
    <Provider store={store}>
      <HashRouter>
        <App />
      </HashRouter>
    </Provider>
    <Footer />
  </div>
);

export default Root;
