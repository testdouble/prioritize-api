import { createStore, applyMiddleware } from 'redux';
import Reactotron from 'reactotron-react-native';

import rootReducer from './reducers';

export default () => {
  if(__DEV__) {
    return Reactotron.createStore(rootReducer, applyMiddleware());
  } else {
    return createStore(rootReducer);
  }
}
