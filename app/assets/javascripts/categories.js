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
      $(".overlay").hide();
      $("#new-post-container").hide();
      var volunteer = $("input[name='post[volunteer]']:checked").val()
      if (volunteer === "true") {
        $("#services-offered").prepend(response)
      } else {
        $("#services-wanted").prepend(response)
      };
      $(".form-new-post")[0].reset()
    })

    .fail(function(response) {
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
