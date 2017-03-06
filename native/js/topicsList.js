import React from 'react';
import {
  Button,
  StyleSheet,
  Text,
  TextInput,
  View
} from 'react-native';
import { connect } from 'react-redux';

import { addTopic } from './store/actions/topics';

class TopicsList extends React.Component {
  state = {
    title: '',
    description: ''
  }

  render() {
    return (
      <View>
        <Text>Title:</Text>
        <TextInput
          style={styles.input}
          onChangeText={(title) => this.setState({title})}
        />

        <Text>Description:</Text>
        <TextInput
          multiline={true}
          style={styles.input}
          onChangeText={(description) => this.setState({description})}
        />
        <Button
          title="Submit"
          onPress={() => this.props.addTopic({
            title: this.state.title,
            description: this.state.description
          })}
        />

      {this.props.topics.map((t) => {
        return (<Text>{t.title}</Text>);
      })}
      </View>
    );
  }
}

export default connect(
  state => ({
    topics: state.topics.topics
  }),
  dispatch => ({
    addTopic: () => dispatch(addTopic())
  })
)(TopicsList);

const styles = StyleSheet.create({
  input: {
    height: 40,
    borderColor: '#0f0f0f',
    borderWidth: 1
  }
});
