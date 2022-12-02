import consumer from "./consumer";

const appRoom = consumer.subscriptions.create("ChatRoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    return alert(data["chat_message"]);
  },

  speak: function (chat_message) {
    return this.perform("speak", { chat_message: chat_message });
  },
});

if (/chat_rooms/.test(location.pathname)) {
  window.document.addEventListener("keydown", (event) => {
    if (event.target.className === "chat-room__message-form_textarea") {
      if (event.key == "Enter") {
        appRoom.speak(event.target.value);
        event.target.value = "";
        event.preventDefault();
      }
    }
  });
}
