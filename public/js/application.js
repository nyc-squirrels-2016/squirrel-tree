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
});
