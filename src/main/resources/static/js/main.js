$(document).ready(function(){
    // // jQuery methods go here...
    console.log("Page loaded");
    console.log($("#orbDateButton").hasClass("preload"));
    // Show modal for orbs between dates if form was submitted
    if ($("#orbDateButton").hasClass("preload")) {
        console.log("Form was processed");
        $("#orbsBetweenDates").modal('show');
    }

    // Turn on tooltips
    $('[data-toggle="tooltip"]').tooltip();
    

    // Verification for editing orb number
    console.log($("#orbDateButton").hasClass("preload"));
    $("#editOrbCount").submit(function(event) {
        // Second input has orb number
        var $inputNum = $("input").filter(":nth-child(2)");
        $inputNum.removeClass("is-invalid");
        console.log($inputNum.val());
        if ($inputNum.val() % 1 != 0) {
            $inputNum.addClass("is-invalid");
            event.preventDefault(); // Stop form submission
            return;
    	}
    });

    // Verification for checking dates
    $("#calculateOrbs").submit(function(event) {
        var startDate = Date.parse($("#startDate").val());
        var endDate = Date.parse($("#endDate").val());
        $("#startDate").removeClass("is-invalid");
        $("#endDate").removeClass("is-invalid");
        if (startDate >= endDate) { // If start date is after or on end date - don't submit form
            $("#startDate").addClass("is-invalid");
            $("#endDate").addClass("is-invalid");
            event.preventDefault();
            return;
        }
    });
});