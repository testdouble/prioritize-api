import React from 'react';

import './config/reactotron';

import { Provider } from 'react-redux';
import configureStore from './store/configureStore';
const store = configureStore();

import TopicsList from './topicsList';

export default () => {
  return (
    <Provider store={store}>
      <TopicsList />
    </Provider>
  );
}
