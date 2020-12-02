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
    debugger
  	$("#notifications").prepend(data.html);
  
  	
  	// console.log("receiving:")
  	// console.log(data)
  	// $('#msg').append('<div class="message"> ' + data.content + '</div>')
    // Called when there's incoming data on the websocket for this channel
  }
});
