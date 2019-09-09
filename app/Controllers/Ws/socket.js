"use strict";

const Ws = use("Ws");

Ws.channel("chat", function(socket) {
  console.log("Socket conectado", sokect.id);
});
