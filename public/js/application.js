$(document).ready(function() {
  $("#new-squirrel-form").on("submit", function(e){
    e.preventDefault();
    var form = this;
    var request = $.ajax({
            type: "POST",
            url: "/squirrels",
            data: $(this).serialize(),
            dataType: "json"});

    request.done(function(squirrel) {
      var html = buildSquirrelDiv(squirrel);
      $("#squirrel-container").prepend(html);
      form.reset();
    });

    request.fail(function(error) {
      $("#error-box").text(error.responseText);
    });
  });

  $("#squirrel-container").on("click", ".fancy", function(e) {
    // $(this).siblings(".squirrel-heading").css("color", getRandomColor());
    var element = e.target;
    var request = $.ajax({
      type: 'GET',
      url: '/colors',
      dataType: 'json'
    });

    request.done(function(response) {
      $(element).siblings(".squirrel-heading").css("color", response.color);
    });

    request.fail(function(error) {
      console.log("Uh-oh! " + error);
    });
  });
});

function getRandomColor() {
  var letters = '0123456789ABCDEF'.split('');
  var color = '#';
  for (var i = 0; i < 6; i++ ) {
    color += letters[Math.floor(Math.random() * 16)];
  }
  return color;
}
// from http://stackoverflow.com/a/1484514 via Anatoliy

function buildSquirrelDiv(squirrel) {
  var html = ["<div>",
      "<h1 class='squirrel-heading'>",
      squirrel.u,
      "</h1>",
      "<p>",
      squirrel.u,
      " is a ",
      squirrel.c,
      " squirrel.<a href='/squirrels/",
      squirrel.i,
      "'>Click here</a> to view ",
      squirrel.u,
      "'s profile.</p>",
      "<button class='fancy'>Click me!</button>",
    "</div>"].join("");
  return html;
}


