import React from 'react';

import './config/reactotron';
import './workers/topicsListener';

import { Provider } from 'react-redux';
import store from './store';

import TopicsList from './topicsList';

export default () => {
  return (
    <Provider store={store}>
      <TopicsList />
    </Provider>
  );
}
