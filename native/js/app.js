import React from 'react';
import {
  Button,
  Text,
  TextInput,
  View
} from 'react-native';
import { Provider } from 'react-redux';

import { addTopic } from './store/actions/topics';

import configureStore from './store/configureStore';

const store = configureStore();

export default (props) => {
  return (
    <Provider store={ store }>
      <View>
        <Text>Title:</Text>
        <TextInput style={{height: 40, borderColor: '#0f0f0f', borderWidth: 1}}></TextInput>
        <Text>Description:</Text>
        <TextInput multiline={true} style={{height: 40, borderColor: '#0f0f0f', borderWidth: 1}}></TextInput>
        <Button title="Submit" onPress={() => alert("Hi")}/>
      </View>
    </Provider>
  );
}
