App.speaker = App.cable.subscriptions.create("SpeakerChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {}
});