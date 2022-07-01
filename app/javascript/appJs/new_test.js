
$('.dp-project-item').click((event) => {
    const project_id = $(event.target).attr("value");
    const project_name = $(event.target).text();

    $('#test_project_id').val(project_id);
    $('.bt-select-project').text(project_name);
})