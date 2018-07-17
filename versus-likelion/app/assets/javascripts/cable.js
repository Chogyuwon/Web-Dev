// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `rails generate channel` command.
//
//= require action_cable
//= require_self
//= require_tree ./channels

(function() {
  this.App || (this.App = {});
  
  //디벨롭 모드
  // App.cable = ActionCable.createConsumer();
  //프로덕션 모드
  App.cable = ActionCable.createConsumer("/cable");

}).call(this);
