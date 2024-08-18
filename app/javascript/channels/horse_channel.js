// app/javascript/channels/horse_channel.js
import consumer from "./consumer"

consumer.subscriptions.create("HorseChannel", {
  connected() {
    console.log("Connected to HorseChannel")
  },

  disconnected() {
    console.log("Disconnected from HorseChannel")
  },

  received(data) {
    console.log("Received data:", data)
    // Vous pouvez ajouter du code pour mettre à jour le DOM ici
  }
})
