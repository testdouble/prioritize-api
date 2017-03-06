import { ADD_TOPIC } from '../constants';

const initialState = {
  topics: []
}

export default (state = initialState, action) => {
  switch(action.type) {
    case ADD_TOPIC:
      return {
        ...state,
        topics: state.topics.concat(action.payload)
      }
    default:
      return state;
  }
}
