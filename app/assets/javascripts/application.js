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

    $(".overlay, .login-container, #new-post-container, #edit-user-container, .register-container").hide();


  });

  $(document).on("submit", "#login-form", function(event){
    event.preventDefault();
    var url = window.location.href;
    var loginData = $(this).serialize();
    var request = $.ajax({
      method: "post",
      url: "/signin",
      data: loginData
    })

    .done(function(response) {
      window.location.replace(url)
    })

    .fail(function(response) {
      $(".errors").text("Email or Password is Incorrect");
    });

  });

  $(document).on("click", ".left-section a", function(event){
    event.preventDefault();
    $(".errors").empty();
    $(".login-container, #new-post-container").hide();
    $(".register-container").show();
  });

  $(document).on("submit", "#register-form", function(event){
    event.preventDefault();
    var url = window.location.href;
    var newUserData = $(this).serialize();
    console.log(newUserData);
    var request = $.ajax({
      method: "post",
      url: "/users",
      data: newUserData
    })

    .done(function(response){
        window.location.replace(url);
    })

    .fail(function(response) {
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
    console.log("Here we are")
    postData = $(this).serialize();
    console.log(postData);
    method = $(this).attr("method");
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
      $(".errors").text("All fields must be filled.")
    });


  });



});
