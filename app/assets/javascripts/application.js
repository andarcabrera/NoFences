//jshint jquery:true
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

$(document).ready(function(){

  $(document).on("click", "#login-button", function(event){
    event.preventDefault();
    $(".errors").empty();
    $(".overlay").fadeIn(400);
    $(".login-container").show();
  });

  $(document).on("click", "#x", function(event){
    $(".overlay, .login-container, #new-post-container, #edit-user-container, .register-container, #post-search-results").hide();
    $("form").each(function() { this.reset(); });
  });

  $(document).on("submit", "#login-form", function(event){
    event.preventDefault();
    var url = window.location.href;
    var loginData = $(this).serialize();
    var request = $.ajax({
      method: "post",
      url: "/signin",
      data: loginData
    });

    request.done(function(response) {
      window.location.replace(url);
    });

    request.fail(function(response) {
      $(".errors").text("Email or Password is Incorrect");
    });
  });

  $(document).on("click", ".left-section a", function(event){
    event.preventDefault();
    $(".errors").empty();
    $(".login-container, #new-post-container").hide();
    // get new user
    var request = $.ajax({
      method: "get",
      url: "/users/new"
    });
    request.done(function(response) {
      $(".reg-form").append(response);
      $(".register-container").show();
    });
    request.fail(function(response) {
      $(".errors").text("Could not load new user form");
    });
  });

  $(document).on("submit", "#register-form", function(event){
    event.preventDefault();
    var url = window.location.href;
    var newUserData = $(this).serialize();
    var request = $.ajax({
      method: "post",
      url: "/users",
      data: newUserData
    });

    request.done(function(response){
      window.location.replace(url);
    });

    request.fail(function(response) {
      $(".errors").text("There was a problem with your registration form. Please make sure all fields are filled out correctly.").css("color", "red");
    });
  });

  // USER JS


  $(document).on("click", "#update", function(event){
    event.preventDefault();
    $(".overlay").fadeIn(400);
    $("#edit-user-container").show();
  });

  $(document).on("submit", ".user-edit", function(event){
    event.preventDefault();
    var postData = $(this).serialize();
    var method = $(this).attr("method");
    var url = $(this).attr("action");
    var return_url = window.location.href;

    var request = $.ajax({
                  url: url,
                  method: method,
                  data: postData
                  });
    request.done(function(response){
      window.location.replace(return_url);
    });
    request.fail(function(response){
      $(".errors").text("All fields must be filled.");
    });
  });

  // Chains & Messages

  $(document).on("click", "#reply-link", function(event){
    event.preventDefault();
    var url = $(this).attr("href");

    var request = $.ajax({
      method: 'get',
      url: url
    });

    request.done(function(html){
      $(".overlay").fadeIn(400);
      $("#new-message-container").append(html);
    });
  });

  $(document).on("click", "#message-close", function(){
    $("#new-message-container").empty();
    $(".overlay").fadeOut(400);
  });

  $(document).on("submit", "#new-message-form", function(event){
    event.preventDefault();
    var url = $(this).attr("action");
    var method = $(this).attr("method");
    var messageData = $(this).serialize();

    var request = $.ajax({
      method: method,
      url: url,
      data: messageData
    });

    request.done(function(response){
      $("#new-message-container").empty();
      $(".overlay").fadeOut(400);
      $("#reply").html("Message Sent!");
    });
  });

  $(document).on("click", ".chain-show", function(event){
    event.preventDefault();
    var id = ($(this).attr("id"));
    var url = $(this).attr("href");
    divId = ($(this).parents().eq(1).attr("id"));

    var request = $.ajax({
            url: url,
            method: "get",
            data: id
    });

    request.done(function(response){
      $(".overlay").fadeIn(400);
      $("#message-container").append(response);
      $("#message-container").show();
    });
  });

  $(document).on("click", "#chain-close", function(event){
    event.preventDefault();
    $(this).parent().empty();
    $("#message-container").hide();
    $(".overlay").fadeOut(400);

  });

  $(document).on("submit", "#new-reply-form", function(event){
    event.preventDefault();
    var url = $(this).attr("action");
    var method = $(this).attr("method");
    var messageData = $(this).serialize();

    $.ajax({
      method: method,
      url: url,
      data: messageData
    })
    .done(function(response){
      $("#message-container").empty();
      $("#message-container").hide();
      $(".overlay").fadeOut(400);
      $("#" + divId).replaceWith(response);
    });
  });

  
  // user photo update

  $(document).on("click", "#user-image-link", function(event){
    event.preventDefault();
    $(".overlay").fadeIn(400);
    $(".update-image-form").show();
  });

  $(document).on("click", ".close", function(event){
    event.preventDefault();
    $(".update-image-form").hide();
    $(".overlay").fadeOut(400);
  });

  $(document).on("submit", ".update-image-form", function(event){
    event.preventDefault();
    var method = $(this).attr("method");
    var url = $(this).attr("action");
    var imgLink = $(".update-image-form").find("input[type=file]").val()

    $.ajax({
      method: method,
      url: url,
      data: { "photo": imgLink }
    })

    .done(function(response){
      $("#user-image-form").empty().hide();
      $(".overlay").fadeOut(400);
    })

    .fail(function(response) {
      $(".errors").text("Sorry, your photo could not be uploaded.");
    });
  });
   

});
