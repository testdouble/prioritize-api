import { ADD_TOPIC } from '../constants';

export const addTopic = (topic) => {
  return {
    type: ADD_TOPIC,
    payload: topic
  }
}
