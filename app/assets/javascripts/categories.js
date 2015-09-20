  $(document).on("click", "#login-to-post-button", function(event){
    event.preventDefault();
    $(".overlay").fadeIn(400);
    $(".login-container").show();
  });

  $(document).on("click", "#volunteer-button", function(event){
    event.preventDefault();
    $(".overlay").fadeIn(400);
    $("#new-post-container").show();
  });

  $(document).on("submit", ".form-new-post", function(event){
    event.preventDefault();
    var return_url = window.location.href;
    var postData = $(this).serialize();
    var method = $(this).attr("method");
    var url = $(this).attr("action");

    $.ajax({
      method: method,
      url: url,
      data: postData
    })

    .done(function(response){
        window.location.replace(return_url);
    })

    .fail(function(response) {
        $(".errors").text("All fields must be filled.");
    });
  });

