var settingsBt = document.getElementById('project_settings_bt');

var newProjectBt = document.getElementById('new_prject_bt');
var newProjectModal = document.getElementById('new_project_modal');


$("#new_prject_bt").click(function(){
    $("#new_project_modal").addClass("is-active");
  });


$(".remove_new_project_modal").click(function(){
    $("#new_project_modal").removeClass("is-active");
});
