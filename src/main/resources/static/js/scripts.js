$(document).ready(function () {
 
    $(".searchBtn").click(function(){
        $(".pageWrapper").addClass("searchActive");
      });
    $(".registerBtn").click(function(){
        $(".registerWrapper").addClass("registerActive");
        $(".pageWrapper").addClass("registerActive");
      });
      $("#searchCar").click(function () {
        $(".searchWrapper").show();
   
    });

      $(".showCarInfo").click(function () {
        $(this).parent().parent().parent().siblings(".col-xs-6").children($("#car-modal")).show();
        $("#account-modal").hide();
    });
    $(".closeX").on("click", function (e) {
        e.preventDefault();
        $(".sModal").hide();
    });
      $("#accountBtn").click(function () {
        $("#account-modal").show();
    });
    $(".closeX-account").on("click", function (e) {
        e.preventDefault();
        $("#account-modal").hide();
    });
    $(".frontPageHeader").on("click", function () {
        window.location.href = "carDealerView.html";
    });

});


