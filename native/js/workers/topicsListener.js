import { Socket } from 'phoenix';

import { addTopic } from '../store/actions/topics';
import store from '../store';

const socket = new Socket("ws://localhost:4000/socket", {params: {userToken: '123'}});
socket.connect();

var topicsChannel = socket.channel('topics:suggest', {});

topicsChannel.on('newTopic', function(payload) {
  store.dispatch(addTopic(payload));
});

topicsChannel.join()
  .receive('ok', function(resp) { console.log('got an OK response', resp) })
  .receive('error', function(resp) { console.log('got an error response', resp) });
