// for phoenix_html support, including form and button helpers
// copy the following scripts into your javascript bundle:
// * https://raw.githubusercontent.com/phoenixframework/phoenix_html/v2.3.0/priv/static/phoenix_html.js
//
window.socket = new Phoenix.Socket("/socket", {params: {userToken: '123'}});
socket.connect();

var newTopicTitle = document.getElementById('title');
var newTopicDesc = document.getElementById('description');
var submitButton = document.getElementById('submitnewtopic');

var topicsChannel = socket.channel('topics:suggest', {});
// var rankChannel = socket.channel('topics:rank', {});
// var discussChannel = socket.channel('topics:discuss', {});

function handlevote(topicid) {
    var userselect = document.getElementById('userselect');
    var userid = userselect.options[userselect.selectedIndex].value

    topicsChannel.push('addVote', {
        user_id: userid,
        topic_id: topicid
    })
}

submitButton.onclick = function() {
  topicsChannel.push('addTopic', {
    title: newTopicTitle.value,
    description: newTopicDesc.value
  });
};

var topicList = document.getElementById('topiclist')

topicsChannel.on('newTopic', function(payload) {
  var li = document.createElement('li');
  li.innerHTML=payload.title;
  topicList.appendChild(li);
  console.log('someone created a new topic:', payload);
});

topicsChannel.on('newVote', function(payload) {
    console.log('someone voted:', payload);
});

topicsChannel.on('failedVote', function(payload) {
    console.log('someone failed to voted:', payload);
});

topicsChannel.join()
  .receive('ok', function(resp) { console.log('got an OK response', resp) })
  .receive('error', function(resp) { console.log('got an error response', resp) });
