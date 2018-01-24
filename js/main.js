$(document).ready(function() {
    console.log('Ready!');
});

$(document).on('mouseenter', '.nav_signup', function() {
    hideSignInForm();
    showSignUpForm();
});

$(document).on('click', '.nav_signup', function() {
    hideSignInForm();
    showSignUpForm();
});

$(document).on('mouseenter', '.nav_signin', function() {
    hideSignUpForm();
    showSignInForm();
});

$(document).on('click', '.nav_signin', function() {
    hideSignUpForm();
    showSignInForm();
});

$(document).on('click', '.js-registration-button', sendRegistrationRequest);

$(document).on('click', '.js-auth-button', sendAuthRequest);

$(document).on('click', '.js-exit', sendLogoutRequest);

$(document).on('keydown', '.js-registration-input', function() {
    $(this).css({"border-color":"black", "border-width":"1px"});
});

$(document).on('keydown', '.js-auth-input', function() {
    $(this).css({"border-color":"black", "border-width":"1px"});
});

function sendAuthRequest() {
    let element_email = $('.js-auth-email');
    let element_password = $('.js-auth-password');

    let is_fields_ok = true;

    // check if fields empty
    $('.js-auth-input').each(function(index, element) {
        if (!$(element).val()) {
            markElementRed(element);
            is_fields_ok = false;
        }
    });

    if (!is_fields_ok) {
        return false;
    }

    let data = {
        email: element_email.val(),
        password: element_password.val()
    };

    $.post('/ajax/user/login', data, function() {
        location.reload();
    });
}

function sendLogoutRequest() {
    $.post('/ajax/user/logout', function() {
        location.reload();
    })
}

function sendRegistrationRequest() {
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

    if (email.indexOf('<') !== -1 || email.indexOf('>') !== -1) {
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

    $.post('/ajax/user/registration', data, function(data) {
        data = getDataFromResponse(data);
        if (data) {
            location.reload();
        }
    });
}

function markElementRed(element) {
    $(element).css({"border-color":"red", "border-width":"2px"});
}

function hideSignInForm() {
    $('div.signin').hide();
}

function showSignInForm() {
    $('div.signin').show();
}

function hideSignUpForm() {
    $('div.signup').hide();
}

function showSignUpForm() {
    $('div.signup').show();
}

function getRandomNumber(to) {
    return Math.floor(Math.random() * to);
}

function getDataFromResponse(data) {
    try {
        data = JSON.parse(data);
        if (data.error) {
            console.error(data.error);
            return false;
        } else if (!data.success) {
            console.error('Cannot get success field in response.');
            return false;
        } else if (!data.data) {
            console.error('Cannot get data field in response.');
            return false;
        } else {
            return data.data;
        }
    } catch (e) {
        console.error(e);
        return false;
    }

    return false;
}