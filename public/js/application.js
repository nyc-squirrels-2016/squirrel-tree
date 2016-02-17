$(document).ready(function() {
  $("#new-squirrel-form").on("submit", function(e){
    e.preventDefault();
    var form = this;
    var request = $.ajax({
            type: "POST",
            url: "/squirrels",
            data: $(this).serialize()});

    request.done(function(response) {
      $("#squirrel-container").prepend(response);
      form.reset();
    });

    request.fail(function(error) {
      $("#error-box").text(error.responseText);
    });
  });

  $("#squirrel-container").on("click", ".fancy", function(e) {
    $(this).siblings(".squirrel-heading").css("color", getRandomColor());
  })
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
