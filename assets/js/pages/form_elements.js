$(document).ready(function(){
    $('.datepicker').pickadate({
        selectMonths: true, // Creates a dropdown to control month
		//selectYears: true, // Creates a dropdown to control Years
        selectYears: 30 // Creates a dropdown of 15 years to control year
    });

    $('input.autocomplete').autocomplete({
        data: {
            "Apple": null,
            "Microsoft": null,
            "Google": 'assets/images/google.png'
        }
    });
});
$('.datepicker').datepicker({
    format: 'yyyy-mm-dd'
});