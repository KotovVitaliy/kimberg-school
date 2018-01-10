$(document).on('click', '.js-registration-button', function() {
    let element_name = $('.js-registration-name');
    let element_fname = $('.js-registration-fname');
    let element_email = $('.js-registration-email');
    let element_password = $('.js-registration-password');

    let is_fields_ok = true;

    // check if fields empty
    $('.js-registration-input').each(function(index, element) {
        if (!$(element).val()) {
            markElementRed(element);
            is_fields_ok = false;
        }
    });

    // check correct email
    let email = element_email.val();
    let regexp_result = /.+@.+/.test(email);
    if (!regexp_result) {
        markElementRed(element_email);
        is_fields_ok = false;
    }

    if (!is_fields_ok) {
        return false;
    }

    let data = {
        name: element_name.val(),
        fname: element_fname.val(),
        email: email,
        password: element_password.val()
    };

    $.post('/ajax/user/registration', data);

});

$(document).on('keydown', '.js-registration-input', function() {
    $(this).css({"border-color":"black", "border-width":"1px"});
});

function markElementRed(element) {
    $(element).css({"border-color":"red", "border-width":"2px"});
}