$(function(){

	var scrollBarWidth = $(window).outerWidth() - $(window).innerWidth();

	//=========================================================================

	var changeHash = function(hash){
		if(history.pushState) {
			history.pushState(null, null, hash);
		}
		else {
			location.hash = hash;
		}
	};

	var hideForm = function(){
		var container = $('.form-container');
		container.find('input, textarea, select').val('');
		container.find('.form-error').empty();
		container.find('.form-success').empty();
		container.find('.warn').removeClass('warn');
		container.css('display', 'none');
		enableScrolling();
	};

	var showForm = function(container){
		container
			.css({
				'display': 'block',
				'opacity': 0
			})
			.animate(
				{'opacity': 1},
				300
			);
		disableScrolling();
	};

	var warnField = function(field){
		if(field.hasClass('warn')) {
			return;
		}
		field.addClass('warn');
	};

	var unwarnField = function(field) {
		if(!field.hasClass('warn')) {
			return;
		}
		field.removeClass('warn');
	};

	var fieldValidators = {
		'name': function(field) {
			var value = field.val();
			if(value == '') {
				warnField(field);
				return 'Имя не указано';
			} else if(value.length < 2) {
				warnField(field);
				return 'Имя слишком короткое';
			}
			unwarnField(field);
			return true;
		},
		'fname': function(field) {
			var value = field.val();
			if(value == '') {
				warnField(field);
				return 'Фамилия не указано';
			} else if(value.length < 2) {
				warnField(field);
				return 'Фамилия слишком короткое';
			}
			unwarnField(field);
			return true;
		},
		'surname': function(field) {
			var value = field.val();
			if(value == '') {
				warnField(field);
				return 'Фамилия не указано';
			} else if(value.length < 2) {
				warnField(field);
				return 'Фамилия слишком короткое';
			}
			unwarnField(field);
			return true;
		},
		'class': function(field) {
			var value = field.val();
			if(value == '') {
				warnField(field);
				return 'Класс не указан';
			}
			unwarnField(field);
			return true;
		},
		'email': function(field){
			var value = field.val();
			if(value == '') {
				warnField(field);
				return 'E-mail не указан';
			} else if(!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,5})+$/.test(value)) {
				warnField(field);
				return 'E-mail указан неверно';
			}
			unwarnField(field);
			return true;
		},
		'phone': function(field){
			var value = field.val();
			if(value == '') {
				warnField(field);
				return 'Телефон не указан';
			} else if(value.replace(/[^0-9]+/g, '').length < 10) {
				warnField(field);
				return 'Телефон указан неверно';
			}
			unwarnField(field);
			return true;
		},
		'password': function(field){
			var value = field.val();
			if(value == '') {
				warnField(field);
				return 'Введите пароль';
			} else if (value.length < 2) {
				warnField(field);
				return 'Пароль должен быть длиной не менее 2 символа';
			}
			unwarnField(field);
			return true;
		},
		'repeatPassword': function(field){
			var value = field.val();
			var passValue = field.parents('form')
				.find('input[name="password"]').val();
			if(value == '') {
				warnField(field);
				return 'Введите пароль ещё раз';
			} else if(value != passValue) {
				warnField(field);
				return 'Пароли не совпадают';
			}
			unwarnField(field);
			return true;
		},
		'question': function(field){
			var value = field.val();
			if(value == '') {
				warnField(field);
				return 'Вопрос не указан';
			} else if(value.length <= 2) {
				warnField(field);
				return 'Вопрос слишком короткий: ' +
					'напишите, пожалуйста, более развёрнутый вопрос';
			}
			unwarnField(field);
			return true;
		}
	};

	var revalidateField = function(field) {
		let fieldName = field.attr('name');
		let value = field.val();
		console.log(fieldName);
		if(typeof fieldName === 'undefined' || (field.hasClass('novalidate') && value === "")) {
			return true;
		}
		var result = fieldValidators[fieldName](field);
		return result;
	};

	let revalidateForm = function(form) {
		let errorMessages = [];
		let fields = form.find('input, textarea, select').toArray();
		for(let i in fields) {
			let result = revalidateField($(fields[i]));
			if (result === true) {
				continue;
			}
			errorMessages.push(result);
		}
		let errorsField = form.find('.form-error');
		if ( errorMessages.length == 0) {
			errorsField.empty();
			return true;
		}
		errorsField.html(errorMessages.join('<br>'));
		return false;
	};

	var sendFormData = function(form) {
		let formId = form.attr('id');
        let url = '/subscribe' + form.data('url');

		if (!revalidateForm(form)) {
			return;
		}

		var formData = form.serialize() + "&formId=" + formId;
        $.post(url, formData, function(response) {
            	form.find('.form-error').html('');
            	form.find('.form-success').html('Ваше сообщение получено.<br>Мы свяжемся с вами с ближайшее время!');
				setTimeout(hideForm, 2501);
			}
		).fail(function(){
			form.find('.form-error').html(
				'К сожалению, произошла ошибка.<br>'
				+ 'Пожалуйста, попробуйте ещё раз!<br>'
				+ 'Или свяжитесь с нами<br>'
				+ 'по номеру телефона:<br>'
				+ '+7 (926) 886-54-97'
			);
		});
	};

	var disableScrolling = function(){
		var top = $('body').scrollTop();
		var left = $('body').scrollLeft();
		$('body').css({
		    overflow: 'hidden',
		    height: '100%'
		});
		$('body > *').css('margin-right', scrollBarWidth);
		$('body').scrollTop(top);
		$('body').scrollLeft(left);
	};

	var enableScrolling = function(){
		$('body').css({
		    overflow: 'auto',
		    height: 'auto'
		});
		$('body > *').css('margin-right', 0);
	};

	$('form').submit(function(e) {
		e.preventDefault();
		sendFormData($(this));
	});

	$('.subscribe-link').click(function() {
		let text = $(this).text();
		let container = $('#subscribe-container');
        showForm(container);
		return false;
	});

	$('#sign-in-link').click(function(){
		var container = $('#auth-form-container');
		showForm(container);
		return false;
	});

	$('#restore-link').click(function(){
		hideForm();
		var container = $('#restore-form-container');
		showForm(container);
		return false;
	});

	$('.register-link').click(function(){
		var container = $('#register-form-container');
		showForm(container);
		return false;
	});

	$('#ask-question').click(function(){
		var container = $('#question-form-container');
		showForm(container);
		return false;
	});

	//Forms hiding
	$('.form-container, .close').click(function(e){
		if(e.target == this) {
			hideForm();
		}
	});

	$(document).on('keyup blur change', function(event){
		event = event || window.event;
    	var isEscape = false;
    	if ("key" in event) {
	        isEscape = (event.key == "Escape" || event.key == "Esc");
    	} else {
        	isEscape = (event.keyCode == 27);
    	}
    	if (isEscape && $('.form-container:visible').length > 0) {
        	hideForm();
    	}
	});

	$('.form-container').scroll(function(e){
		e.stopPropagation();
	});
	
	$('.form-container input, .form-container textarea').on('keyup', function(){
		var field = $(this);
		if(!field.hasClass('warn')) {
			return;
		} else {
			if (field.hasClass('novalidate') && field.val() === "") {
				field.removeClass('warn');
			}
		}
		revalidateField(field);
	});

	$('.form-container select').on('change', function() {
        var field = $(this);
        if(!field.hasClass('warn')) {
            return;
        }
        revalidateField(field);
	});

	//Main menu smooth scrolling
	$('nav a:not(#social_menu, #back_social_menu), #up-button').click(function(){
		var hash = $(this).attr('href');
		var topPosition = $(hash).offset().top;
		var duration = topPosition / 4 + 300;

		$("html, body").stop().animate(
			{scrollTop: topPosition},
			duration,
			"swing",
			function(){
				changeHash(hash);
			}
		);

		return false;
	});

    $('nav a#social_menu').click(function () {
        $('.common-nav').hide(1);
        $('.social-nav').show(1);
    });

    $('nav a#back_social_menu').click(function() {
        $('.social-nav').hide(1);
        $('.common-nav').show(1);
	});

	$('#currentYear').html((new Date()).getFullYear());

});