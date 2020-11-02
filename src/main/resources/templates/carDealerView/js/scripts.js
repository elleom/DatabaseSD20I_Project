$(document).ready(function () {
 
    $(".searchBtn").click(function(){
        $(".pageWrapper").addClass("searchActive");
      });
    $(".registerBtn").click(function(){
        $(".registerWrapper").addClass("registerActive");
        $(".pageWrapper").addClass("registerActive");
        $("#login-modal").hide();
      });
      $("#searchCar").click(function () {
        $(".searchWrapper").show();
   
    });
      $("#loginBtn").click(function () {
        $("#login-modal").show();
 
        $("#account-modal").hide();
    });
      $(".showCarInfo").click(function () {
        $("#car-modal").show();
        $("#account-modal").hide();
        $("#login-modal").hide();
    });
    $(".closeX").on("click", function (e) {
        e.preventDefault();
        $("#login-modal").hide();
        $(".sModal").hide();
    });
      $("#accountBtn").click(function () {
        $("#account-modal").show();
        $("#login-modal").hide();
    });
    $(".closeX-account").on("click", function (e) {
        e.preventDefault();
        $("#account-modal").hide();
    });
    $(".frontPageHeader").on("click", function () {
        window.location.href = "carDealerView.html";
    });

});


