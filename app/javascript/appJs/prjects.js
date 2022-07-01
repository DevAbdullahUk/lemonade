$("#new_prject_bt").click(function(){
    $("#new_project_modal").addClass("is-active");
  });


$(".remove_new_project_modal").click(function(){
    $("#new_project_modal").removeClass("is-active");
});


$(function(){ 
  var datadump = ($('#trackers').data('trackers'));
  console.log(datadump)
});