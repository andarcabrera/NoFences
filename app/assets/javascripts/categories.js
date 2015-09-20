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
