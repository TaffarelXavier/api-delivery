let ws = null;

$(function() {
  // Only connect when username is available
  if (window.username) {
    startChat();
  }
});

function startChat() {
  ws = adonis.Ws().connect();

  ws.on("open", () => {
    $(".connection-status").addClass("connected");
    subscribeToChannel();
  });

  ws.on("error", () => {
    $(".connection-status").removeClass("connected");
  });
}

function subscribeToChannel() {
  const chat = ws.subscribe("chat");

  chat.on("error", () => {
    $(".connection-status").removeClass("connected");
  });

  chat.on("message", message => {
    $(".messages").append(`
        <div class="message"><h3> ${message.username} </h3> <p> ${message.body} </p> </div>
      `);
  });
}

$("#name").keyup(function(e) {


  if (e.keyCode === 13) {
    e.preventDefault();
    const message = $(this).val();
    alert(message);
    $(this).val("");

    ws.getSubscription("chat").emit("message", {
      username: window.username,
      body: message
    });
    return;
  }
});
$("#message").keyup(function(e) {
  e.preventDefault();

  if (e.keyCode === 13) {
    const message = $(this).val();
    alert(message);
    $(this).val("");

    ws.getSubscription("chat").emit("message", {
      username: window.username,
      body: message
    });
    return;
  }
});
