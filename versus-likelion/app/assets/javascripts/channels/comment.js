jQuery(document).on('turbolinks:load', function() {
  var postroom_id = $("#hidden-id").val();
  console.log(App.cable.subscriptions['subscriptions']);
  
  if (App.cable.subscriptions['subscriptions'].length >= 3) {
    for(var i=0; i < App.cable.subscriptions['subscriptions'].length; i++){
      var parser = JSON.parse(App.cable.subscriptions['subscriptions'][i].identifier);
      if(parser.channel == "CommentChannel"&& parser.room != postroom_id){
        App.cable.subscriptions.remove(App.cable.subscriptions['subscriptions'][i]);
      }
    };
  }
  console.log(App.cable.subscriptions['subscriptions']);


App.comment = App.cable.subscriptions.create({channel: "CommentChannel", room: postroom_id}, {
    connected: function() {
      if(postroom_id == undefined){
        console.log("댓글채널 인덱스 페이지 연결되었습니다.");
      }else{
        console.log("댓글채널"+postroom_id+"번 방 연결되었습니다.");  
      }
    },
    disconnected: function() {
      if(postroom_id == undefined){
        console.log("댓글채널 인덱스 페이지를 나갔습니다.");
      }else{
        console.log("댓글채널"+postroom_id+"번 방에서 나갔습니다.");  
      }
    },
    received: function(data) {
      if(data.post_id == postroom_id){
        var user_id = $("#hidden-user_id").val();
        console.log(data);
        if(data.choice== "1"){
          if(user_id == data.user_id){
            $( ".comment_box_1" ).prepend(
              "<div class='comment_small_box' id='comment_"+data.comment_id+"'>"+
                "<div class='comment_small_box1'>"+
                    "<span><img style='height: 50px; width:50px; border-radius:100px;;' src='"+data.user_image+"'></img></span>"+
                "</div>"+
                  "<div class='comment_small_box2'>"+
                      "<div class='comment_middle_box'>"+
                          "<div>"+
                              "<span>"+data.user_name+"</span>"+
                              "<span style='color:#AAAAAA;'>"+data.created_at+"</span>"+
                              "<span style='display:none;'>"+data.choice+"</span>"+
                          "</div>"+
                          "<p>"+data.content+"</p>"+
                      "</div>"+
                  "</div>"+
                  "<div class='comment_small_box3'>"+
                      "<button id='"+data.comment_id+"' class='comment-edit'><img src='/edit.png'></img></button>"+
                      "<button id='"+data.comment_id+"' class='comment-destoy'><img src='/destroy.png'></img></button>"+
                      "<textarea class='form-control' rows='5' id='textarea-"+data.comment_id+"' name='content' style='display:none;'>"+data.content+"</textarea>"+
                  "</div>"+
              "</div>");
          }else{
            $( ".comment_box_1" ).prepend(
              "<div class='comment_small_box' id='comment_"+data.comment_id+"'>"+
                "<div class='comment_small_box1'>"+
                    "<span><img style='height: 50px; width:50px; border-radius:100px;;' src='"+data.user_image+"'></img></span>"+
                "</div>"+
                  "<div class='comment_small_box2'>"+
                      "<div class='comment_middle_box'>"+
                          "<div>"+
                              "<span>"+data.user_name+"</span>"+
                              "<span style='color:#AAAAAA;'>"+data.created_at+"</span>"+
                              "<span style='display:none;'>"+data.choice+"</span>"+
                          "</div>"+
                          "<p>"+data.content+"</p>"+
                      "</div>"+
                  "</div>"+
              "</div>"
              );          
          }
          $('#first-count-up').replaceWith($("<p class='comment_box_num' id='first-count-up'>1번 댓글 수 :"+data.comments_1_count+"</p>"));
        }else if(data.choice == "2"){
          if(user_id == data.user_id){
            $( ".comment_box_2" ).prepend(
              "<div class='comment_small_box' id='comment_"+data.comment_id+"'>"+
                "<div class='comment_small_box1'>"+
                    "<span><img style='height: 50px; width:50px; border-radius:100px;;' src='"+data.user_image+"'></img></span>"+
                "</div>"+
                  "<div class='comment_small_box2'>"+
                      "<div class='comment_middle_box'>"+
                          "<div>"+
                              "<span>"+data.user_name+"</span>"+
                              "<span style='color:#AAAAAA;'>"+data.created_at+"</span>"+
                              "<span style='display:none;'>"+data.choice+"</span>"+
                          "</div>"+
                          "<p>"+data.content+"</p>"+
                      "</div>"+
                  "</div>"+
                  "<div class='comment_small_box3'>"+
                      "<button id='"+data.comment_id+"' class='comment-edit'><img src='/edit.png'></img></button>"+
                      "<button id='"+data.comment_id+"' class='comment-destoy'><img src='/destroy.png'></img></button>"+
                      "<textarea class='form-control' rows='5' id='textarea-"+data.comment_id+"' name='content' style='display:none;'>"+data.content+"</textarea>"+
                  "</div>"+
              "</div>");
          }else{
            $( ".comment_box_2" ).prepend(
              "<div class='comment_small_box' id='comment_"+data.comment_id+"'>"+
                "<div class='comment_small_box1'>"+
                    "<span><img style='height: 50px; width:50px; border-radius:100px;;' src='"+data.user_image+"'></img></span>"+
                "</div>"+
                  "<div class='comment_small_box2'>"+
                      "<div class='comment_middle_box'>"+
                          "<div>"+
                              "<span>"+data.user_name+"</span>"+
                              "<span style='color:#AAAAAA;'>"+data.created_at+"</span>"+
                              "<span style='display:none;'>"+data.choice+"</span>"+
                          "</div>"+
                          "<p>"+data.content+"</p>"+
                      "</div>"+
                  "</div>"+
              "</div>"
              );          
          }
          $('#second-count-up').replaceWith($("<p class='comment_box_num' id='second-count-up'>2번 댓글 수 :"+data.comments_2_count+"</p>"));
        }else{
          console.log("else입니다.")
          if(user_id == data.user_id){
            $('.comment_box_1.free').prepend(
                "<div class='comment_small_box' id='comment_"+data.comment_id +"'>"+
                  "<div class='comment_small_box1'>"+
                      "<span><img style='height: 50px; width:50px; border-radius:100px;;' src='"+data.user_image+"'></img></span>"+
                  "</div>"+
                  "<div class='comment_small_box2'>"+
                      "<div class='comment_middle_box'>"+
                          "<div>"+
                              "<span>"+data.user_name+"</span>"+
                              "<span style='color:#AAAAAA;'>"+data.created_at+"</span>"+
                          "</div>"+
                          "<p>"+data.content+"</p>"+
                      "</div>"+
                  "</div>"+
                  "<div class='comment_small_box3'>"+
                      "<button id='"+data.comment_id+"' class='comment-edit'><img src='/edit.png'></img></button>"+
                      "<button id='"+data.comment_id+"' class='comment-destoy'><img src='/destroy.png'></img></button>"+
                      "<textarea class='form-control' rows='5' id='textarea-"+data.comment_id+"' name='content' style='display:none;'>"+data.content+"</textarea>"+
                  "</div>"+
                "</div>"
            );
          }else{
            $('.comment_box_1 free').prepend(
                "<div class='comment_small_box' id='comment_"+data.comment_id +"'>"+
                  "<div class='comment_small_box1'>"+
                      "<span><img style='height: 50px; width:50px; border-radius:100px;;' src='"+data.user_image+"'></img></span>"+
                  "</div>"+
                  "<div class='comment_small_box2'>"+
                      "<div class='comment_middle_box'>"+
                          "<div>"+
                              "<span>"+data.user_name+"</span>"+
                              "<span style='color:#AAAAAA;'>"+data.created_at+"</span>"+
                          "</div>"+
                          "<p>"+data.content+"</p>"+
                      "</div>"+
                  "</div>"+
                "</div>"
            );
        }
        $('#first-count-up').replaceWith($("<p id='first-count-up'>댓글 수 :"+data.comments_all_count+"</p>"));
       }
      }
    }
  });
});