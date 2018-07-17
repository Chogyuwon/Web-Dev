jQuery(document).on('turbolinks:load', function() {
  var postroom_id = $("#hidden-id").val();
  console.log(App.cable.subscriptions['subscriptions']);
  
  if (App.cable.subscriptions['subscriptions'].length >= 3) {
    for(var i=0; i < App.cable.subscriptions['subscriptions'].length; i++){
      var parser = JSON.parse(App.cable.subscriptions['subscriptions'][i].identifier);
      if(parser.channel == "VoteChannel"&& parser.room != postroom_id){
        App.cable.subscriptions.remove(App.cable.subscriptions['subscriptions'][i]);
      }
    };
  }
  console.log(App.cable.subscriptions['subscriptions']);
  App.posts = App.cable.subscriptions.create({channel: "VoteChannel", room: postroom_id},{
    connected: function() {
      if(postroom_id == undefined){
        console.log("포스트룸 인덱스 페이지 연결되었습니다.");
      }else{
        console.log("포스트룸"+postroom_id+"번 방 연결되었습니다.");  
      }
    },
    disconnected: function() {
      if(postroom_id == undefined){
        console.log("포스트룸 인덱스 페이지를 나갔습니다.");
      }else{
        console.log("포스트룸"+postroom_id+"번 방에서 나갔습니다.");  
      }
    },
    received: function(data) {
      console.log(typeof(data.post_id));
      if(data.post_id == postroom_id){
        console.log(data);
        var first_choice_count = parseInt(data.first_choice_count);
        var second_choice_count = parseInt(data.second_choice_count);
        var total_choice_count = parseInt(data.total_choice_count);
        var first_percent = Math.floor(first_choice_count*100/total_choice_count);
        var first_percent_string = first_percent+"%";
        var second_percent = 100-first_percent;
        var second_percent_string = second_percent+"%";
        $('.middle_box_left').replaceWith($("<p class='middle_box_left'>"+first_choice_count+ '명</p>'));
        $('.middle_box_right').replaceWith($("<p class='middle_box_right'>"+second_choice_count+ '명</p>'));
        $('#choice-1-count').replaceWith($("<span id='choice-1-count' class = 'choice_left_num'>"+first_percent+"<span class='small-font'>%</span></span>"));
        $('#choice-2-count').replaceWith($("<span id='choice-2-count' class = 'choice_right_num'>"+second_percent+"<span class='small-font'>%</span></span>"));
        $('.left_percent').css("padding-left",first_percent_string);
        $('.right_percent').css("padding-right",second_percent_string);
      }
    }
  });
});