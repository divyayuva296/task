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
       // debugger
     
 
  }
});
