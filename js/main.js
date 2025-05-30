$(document).ready(function() {
	let scrollBarWidth = $(window).outerWidth() - $(window).innerWidth();

	let changeHash = function(hash){
		if(history.pushState) {
			history.pushState(null, null, hash);
		}
		else {
			location.hash = hash;
		}
	};

	function hideForm() {
		let container = $('.form-container');
		container.find('input, textarea, select').val('');
		container.find('[type="checkbox"]').prop("checked", false);
		container.find('#form-error').empty();
		$('.form-container #form-success').empty();
		container.find('#form-success').empty();
		container.css('display', 'none');
		enableScrolling();
	}

	function showForm(container) {
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
	}

	function sendSubscribeFormData() {
        let url = '/subscribe/add';

        let surname = $('#subscribe-form input[name="surname"]').val();
        let name = $('#subscribe-form input[name="name"]').val();

        let subject_els = $('#subscribe-form #disciplines .container input[type="checkbox"]');
        let subjects = [];
        subject_els.each(function(i, el) {
        	if ($(el).prop("checked")) {
				subjects.push($(el).data('name'));
			}
		});

        let classs = $('#subscribe-form select[name="class"]').val();
        let school = $('#subscribe-form input[name="school_number"]').val();
        let email_student = $('#subscribe-form input[name="email_student"]').val();
        let email_parent = $('#subscribe-form input[name="email_parent"]').val();
        let phone = $('#subscribe-form input[name="phone"]').val();
        let question = $('#subscribe-form textarea[name="question"]').val();

        if (!name || !surname || !classs || !school || !email_parent || !email_student) {
			$('.form-container').find('#form-error').html(
				"Пожалуйста, введите все необходимые поля"
			);
			return;
		}

        if (subjects.length === 0) {
			$('.form-container').find('#form-error').html(
				"Пожалуйста, выберите хотя бы одну дисциплину"
			);
			return;
		}

		let data = {
        	surname:surname,
			name:name,
			subjects:subjects,
			class:classs,
			school:school,
			email_student:email_student,
			email_parent:email_parent,
			phone:phone,
			question:question
        };

		sendForm(url, data)
	}

	function sendIntensiveFormData() {
		let url = '/subscribe/add';

		let surname = $('#intensive-form input[name="surname"]').val();
		let name = $('#intensive-form input[name="name"]').val();
		let classs = $('#intensive-form select[name="class"]').val();
		let smena = $('#intensive-form select[name="smena"]').val();
		let email_student = $('#intensive-form input[name="email_student"]').val();
		let email_parent = $('#intensive-form input[name="email_parent"]').val();
		let phone = $('#intensive-form input[name="phone"]').val();
		let format = $('#intensive-form select[name="format"]').val();
		let question = $('#intensive-form textarea[name="question"]').val();

		// if (!name || !surname || !classs || !smena || !email_parent || !email_student) {
		if (!name || !surname || !classs || !email_parent || !email_student) {
			$('.form-container').find('#form-error').html(
				"Пожалуйста, введите все необходимые поля"
			);
			return;
		}

		let data = {
			surname:surname,
			name:name,
			class:classs,
			smena:smena,
			email_student:email_student,
			email_parent:email_parent,
			phone:phone,
			format:format,
			question:question,
			a:'intensive'
		};

		sendForm(url, data)
	}

	let sendForm = function (url, data) {
		$.post(url, data, function() {
				$('.form #form-error').html('');
				$('.form #form-success').html('Ваше сообщение получено.<br>Мы свяжемся с вами с ближайшее время!');
				setTimeout(hideForm, 2501);
			}
		);
	};

	let disableScrolling = function() {
		let top = $('body').scrollTop();
		let left = $('body').scrollLeft();
		$('body').css({
		    overflow: 'hidden',
		    height: '100%'
		});
		$('body > *').css('margin-right', scrollBarWidth);
		$('body').scrollTop(top);
		$('body').scrollLeft(left);
	};

	let enableScrolling = function() {
		$('body').css({
		    overflow: 'auto',
		    height: 'auto'
		});
		$('body > *').css('margin-right', 0);
	};

	$('.subscribe-link').click(function() {
		let container = $('#subscribe-container');
        showForm(container);
		return false;
	});

	$('.schedule').click(function() {
		let container = $('#schedule-container');
        showForm(container);
		return false;
	});

	$('#schedule-container, #results-container').click(function() {
		hideForm();
	});

	$('.results_js').click(function() {
		let container = $('#results-container');
        showForm(container);
		return false;
	});

	$('.intensives_js').click(() => {
		let container = $('#intensive-container');
		showForm(container);
		return false;
	});

	$('.show-more-button').click(function () {
		let $this = $(this);
		let $for = $this.data('for');
		if ($this.hasClass('show')) {
            $this.text("Подробнее");
			$this.removeClass('show');
            $('.for_' + $for).hide(2);
		} else {
            $this.text("Скрыть");
			$this.addClass('show');
            $('.for_' + $for).show(2);
		}
    });

	//Forms hiding
	$('.close').click(function(e){
		if(e.target == this) {
			hideForm();
		}
	});

	$(document).on('click', '#subscribe-form #send', () => {
		sendSubscribeFormData();
	});

	$(document).on('click', '#intensive-form #send', () => {
		sendIntensiveFormData();
	});

	$(document).on('click', '#show_result', () => {

	});

	$(document).on('keyup blur change', function(event){
		event = event || window.event;
		let isEscape = false;
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


	//Main menu smooth scrolling
	$('nav.common-nav a:not(#social_menu, #back_social_menu), #up-button').click(function(){
		let hash = $(this).attr('href');
		let topPosition = $(hash).offset().top;
		let duration = topPosition / 4 + 300;

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


function sendStatVK() {
    $.get('/stat/vk');
}

function sendStatInstagram() {
    $.get('/stat/instagram');
}

function moreAboutYan() {
    $.get('/stat/more_about_yan');
}

function moreAboutDan() {
    $.get('/stat/more_about_dan');
}

function moreAboutNick() {
    $.get('/stat/more_about_nick');
}

function moreAboutRome() {
    $.get('/stat/more_about_roma');
}

function sendStatYoutube() {
    $.get('/stat/youtube');
}

function sendStatYoutubeYan() {
    $.get('/stat/youtube-yan');
}

function sendStatYoutubeNick() {
    $.get('/stat/youtube-nick');
}

function sendStatYoutubeDan() {
    $.get('/stat/youtube-dan');
}

function sendSubscribe1() {
    $.get('/stat/subscribe1');
}

function sendSubscribe2() {
    $.get('/stat/subscribe2');
}

function sendSubscribe3() {
    $.get('/stat/subscribe3');
}

function sendSubscribe4() {
    $.get('/stat/subscribe4');
}

function sendShowFaq() {
    $.get('/stat/show_faq');
}

function sendSeeFeedback() {
    $.get('/stat/vk_feedback');
}

function sendOpenSchedule() {
    $.get('/stat/open_schedule');
}
