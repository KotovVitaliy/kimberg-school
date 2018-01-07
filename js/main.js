$(document).on('click', '.js-registration-button', function() {
    let element_name = $('.js-registration-name');
    let element_fname = $('.js-registration-fname');
    let element_email = $('.js-registration-email');
    let element_password = $('.js-registration-password');

    $('.js-registration-input').each(function(index, element) {
        if (!$(element).val()) {
            markElementRed(element);
        }
    });
});

$(document).on('keydown', '.js-registration-input', function() {
    $(this).css({"border-color":"black", "border-width":"1px"});
});

function markElementRed(element) {
    $(element).css({"border-color":"red", "border-width":"2px"});
}