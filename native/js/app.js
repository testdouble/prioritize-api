import React from 'react';
import {
  Button,
  Text,
  TextInput,
  View
} from 'react-native';

export default (props) => {
  return (
    <View>
      <Text>Title:</Text>
      <TextInput style={{height: 40, borderColor: '#0f0f0f', borderWidth: 1}}></TextInput>
      <Text>Description:</Text>
      <TextInput multiline={true} style={{height: 40, borderColor: '#0f0f0f', borderWidth: 1}}></TextInput>
      <Button title="Submit" />
    </View>
  );
}
