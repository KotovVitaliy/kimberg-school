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
		container.find('input, textarea')
			//.removeAttr('required')
			.val('');
		container.find('.form-error').empty();
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
				300,
				function(){
					// container.find('.required')
					// 	.attr('required', 'required');
				}
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
		var fieldName = field.attr('name');
		if(typeof fieldName === 'undefined' ||
			field.hasClass('novalidate')) {
			return true;
		}
		var result = fieldValidators[fieldName](field);
		return result;
	};

	var revalidateForm = function(form) {
		var errorMessages = [];
		var fields = form.find('input, textarea').toArray();
		for(i in fields) {
			var result = revalidateField($(fields[i]));
			if (result === true) {
				continue;
			}
			errorMessages.push(result);
		}
		var errorsField = form.find('.form-error');
		if ( errorMessages.length == 0) {
			errorsField.empty();
			return true;
		}
		errorsField.html(errorMessages.join('<br>'));
		return false;
	};

	var sendFormData = function(form) {
		var formId = form.attr('id');
        var url = '/ajax' + form.data('url');
		if (!revalidateForm(form)) {
			return;
		}

		var formData = form.serialize() + "&formId=" + formId;
        $.post(url, formData, function(response) {
				/**
				 * Обработка данных response. В случае ошибок -
				 * их отображение (см. выше образец)
				 */
				hideForm();
			}
		).fail(function(){
			form.find('.form-error').html('К сожалению, произошла ошибка.<br>' +
				'Пожалуйста, попробуйте ещё раз!');
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
		}
		var form = field.parents('form');
		revalidateForm(form);
	});

	//Main menu smooth scrolling
	$('nav a, #up-button').click(function(){
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

	$('#currentYear').html((new Date()).getFullYear());

});