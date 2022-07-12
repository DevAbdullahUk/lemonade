
$(document).ready(function(){
    $(".test-case-row").on("click", function(){
        const testLink = $(this).attr("link");
        
        window.location.replace(testLink)
    });
});