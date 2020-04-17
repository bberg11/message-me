App.chat_room = App.cable.subscriptions.create("ChatRoomChannel", {
  connected() {
    console.log('connected');
  },

  disconnected() {
    console.log('disconnected');
  },

  received(data) {
    $('[data-messages]').append(data.html);
    $('[data-message-input]').val('');
    scroll_bottom();
  }
});
    
