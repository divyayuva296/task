import consumer from "./consumer"
 
consumer.subscriptions.create("NotificationChannel",{
  connected() {
    console.log("connected to the room!");
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },
	
  received(data) {
     // alert("hello");
    alert('hi')
    
     console.log(data);
       $("#notifications").prepend(data.html);
       // $("[data-behavior='unread-count']").text(0);
       // $.ajax({
        // url: '/notifications/mark_as_read',
        // method: 'POST',
        // data: {"notifications": notifications},
        // success: function(date){
        //   var data = JSON.parse(data);
        //   console.log(data["notifications"]);
        // }

       // });
       // debugger
     
 
  }
});
