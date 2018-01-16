$(document).ready(function() {
    rotateQutesImgs();
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

$(document).on('click', '.js-auth-button', function() {
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

    $.post('/ajax/user/enter', data);
});

$(document).on('keydown', '.js-registration-input', function() {
    $(this).css({"border-color":"black", "border-width":"1px"});
});

$(document).on('keydown', '.js-auth-input', function() {
    $(this).css({"border-color":"black", "border-width":"1px"});
});

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

function rotateQutesImgs() {
    setInterval(function() {
        let imgs = $('.quotes_img:hidden');
        let current_img = $('.quotes_img:visible');
        let amoun_of_imgs = imgs.length;
        $(current_img).hide(1);
        current_img =  $(imgs).eq(getRandomNumber(amoun_of_imgs));
        current_img.show(1);
    }, 5000);
}

function getRandomNumber(to) {
    return Math.floor(Math.random() * to);
}