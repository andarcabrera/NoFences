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

    var request = $.ajax({
      method: method,
      url: url,
      data: postData
    });

    request.done(function(response){
      $(".overlay").hide();
      $("#new-post-container").hide();
      var volunteer = $("input[name='post[volunteer]']:checked").val();
      if (volunteer === "true") {
        $("#services-offered").prepend(response);
      } else {
        $("#services-wanted").prepend(response);
      }
      $(".form-new-post")[0].reset();
    });

    request.fail(function(response) {
      $(".errors").text("All fields must be filled.");
    });
  });

  $(document).on("click", ".post-tabs li", function(event){
    event.preventDefault();
    $(".post-tabs li").removeClass("active");
    $(".services").hide();
    $(this).addClass("active");
    var id = $(".active").find("a").attr("href");
    $(id).show();
  });

  // search feature
  $(document).on("submit", "#search-form", function(event){
    event.preventDefault();
    var method = $(this).attr("method");
    var url = $(this).attr("action");
    var searchString = $(this).serialize();

    $.ajax({
      method: method,
      url: url,
      data: searchString
    })

    .done(function(response){
      console.log(response);
      $("#post-search-results").empty();
      $(".overlay").show();
      $("#post-search-results").append(response);
      $("#post-search-results").show();
    })

    .fail(function(response) {
      $(".errors").text("Sorry, no matching posts were found.");
    });
  });

