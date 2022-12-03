import consumer from "./consumer";

const appRoom = consumer.subscriptions.create("ChatRoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const chatMessages = document.getElementById('chat-messages');
    chatMessages.insertAdjacentHTML('beforeend', data['chat_message']);
  },

  speak: function(chat_message, chat_room_id) {
    return this.perform('speak', { chat_message: chat_message, chat_room_id: chat_room_id });
  }
});

if (/chat_rooms/.test(location.pathname)) {
  window.document.addEventListener("keydown", (event) => {
    if (event.target.className === "chat-room__message-form_textarea") {
      if (event.key == "Enter") {
        const chat_room_id = document.querySelector('textarea').dataset.chat_room_id;
        appRoom.speak(event.target.value, chat_room_id);
        event.target.value = "";
        event.preventDefault();
      }
    }
  });
}
