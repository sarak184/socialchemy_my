// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
window.addEventListener('load', function(){
    var user_email=$('#current_user_email').html();
    if(user_email){
	var socket=io.connect('http://localhost:8000');

	socket.on('connect', function(){
		console.log('connected to node server');
		//chat to a specific user
	socket.emit('join_room',{

		user_email: user_email,
		chatroom: "iosroom"
	});

	socket.on('user_joined', function(data){
		
		console.log(data.user_email +' joined '+ data.chatroom);



	});

	$('#send-message').click(function(){

		let msg=$('#chat-message-input').val();
		if(message!=''){
			socket.emit('send_message',{ message: msg,
			                             user_email: user_email,
			                             chatroom: "iosroom" });
		}
	});
	});

}
});


