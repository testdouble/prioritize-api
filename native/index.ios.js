/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StatusBar
} from 'react-native';


import App from './js/app';

export default class Prioritize extends Component {
  render() {
    return (
      <App />
    );
  }
}

StatusBar.setHidden(true);

AppRegistry.registerComponent('Prioritize', () => Prioritize);
