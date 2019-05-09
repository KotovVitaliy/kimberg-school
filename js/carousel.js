const html = `
            <div class="progress_block progress_img">
                <img src="/img/progress_{gender}.svg" alt="картинка" />
            </div>
            <div class="progress_block progress_description">
                <p class="progress_name">{name} ({class} класс)</p>
                <ul>
                    {progress}
                </ul>
            </div>
`;

let current_data_index = 0;
let data = [
    {
        'name': 'Тильга Павел',
        'class': 8,
        'progress': [
            'Победитель МОШ',
            'Призер заключительного этапа олимпиады "Максвелл"',
            'Призер iEPhO'
        ],
        'gender': 'M'
    },
    {
        'name': 'Аношин Матвей',
        'class': 8,
        'progress': [
            'Победитель олимпиады "Физтех"',
            'Призер олимпиады "Росатом"',
            'Призер олимпиады "Шаг в будущее"'
        ],
        'gender': 'M'
    },
    {
        'name': 'Фадеев Родион',
        'class': 8,
        'progress': [
            'Призер заключительного этапа ВсОШ за параллель 9 класса',
            'Призер МОШ за параллель 9 класса',
            'Призер олимпиады "Курчатов" за параллель 9 класса',
            'Победитель олимпиады "Курчатовец 21 века"'
        ],
        'gender': 'M'
    },
    {
        'name': 'Котельников Иван',
        'class': 8,
        'progress': [
            'Абсолютный победитель МОШ'
        ],
        'gender': 'M'
    },
    {
        'name': 'Сикалова Лиза',
        'class': 8,
        'progress': [
            'Призер регионального этапа олимпиады "Максвелл"'
        ],
        'gender': 'F'
    },
    {
        'name': 'Молоток Катя',
        'class': 8,
        'progress': [
            'Призер регионального этапа олимпиады "Максвелл"'
        ],
        'gender': 'F'
    },
    {
        'name': 'Глухов Александр',
        'class': 10,
        'progress': [
            'Призер олимпиады "Физтех"',
            'Призер олимпиады "Росатом"'
        ],
        'gender': 'M'
    },
    {
        'name': 'Нистюк Василий',
        'class': 11,
        'progress': [
            'Победитель МОШ призер олимпиады "Физтех"',
            'Призер регионального этапа ВсОШ',
            'Призер олимпиады "Росатом"',
            'Призер олимпиады "Курчатов"'
        ],
        'gender': 'M'
    },
    {
        'name': 'Тумасян Артем',
        'class': 11,
        'progress': [
            'Победитель МОШ',
            'Призер регионального этапа ВсОШ',
            'Призер iEPhO',
            'Победитель олимпиады "Физтех"',
            'Победитель олимпиады "Ломоносов"',
            'Призер олимпиады "Росатом"',
            'Участник заключительного этапа ВсОШ'
        ],
        'gender': 'M'
    },
    {
        'name': 'Жардецкий Евгений',
        'class': 11,
        'progress': [
            'Призер МОШ',
            'Призер олимпиады "Физтех"',
            'Призер олимпиады "Росатом"',
            'Призер олимпиады "Ломоносов"',
            'Призер интернет-олимпиады школьников СПбГУ и ИТМО'
        ],
        'gender': 'M'
    },
    {
        'name': 'Косовская Анна',
        'class': 11,
        'progress': [
            'Победитель олимпиады "Физтех"',
            'Призер олимпиады "Росатом"'
        ],
        'gender': 'F'
    },
    {
        'name': 'Ильин Вадим',
        'class': 11,
        'progress': [
            'Призер олимпиады "Физтех"'
        ],
        'gender': 'M'
    }
];

let interval;
document.addEventListener("DOMContentLoaded", () => {
    setNextCarousel();
    interval = setInterval(setNextCarousel, 5000)
});

$(document).on('click', '#progress_prev', () => {
    clearInterval(interval);
    setPrevCarousel();
    interval = setInterval(setNextCarousel, 5000)
});

$(document).on('click', '#progress_next', () => {
    clearInterval(interval);
    setNextCarousel();
    interval = setInterval(setNextCarousel, 5000)
});

function getNextIndex() {
    let next_index = current_data_index + 1;
    if (!(next_index < data.length)) {
        next_index = 0;
    }
    return next_index;
}

function getPrevIndex() {
    let prev_index = current_data_index - 1;
    if (prev_index < 0) {
        prev_index = data.length - 1;
    }
    return prev_index;
}

function setNextCarousel() {
    let index = getNextIndex();
    console.log("next ", current_data_index, index);
    setCarouselContent(data[index]);
    current_data_index = index;
}

function setPrevCarousel() {
    let index = getPrevIndex();
    console.log("prev ", current_data_index, index);
    setCarouselContent(data[index]);
    current_data_index = index;
}

function setCarouselContent(data_item) {
    let html_copy = html;

    let img = (data_item.gender === 'F') ? 'girl' : 'boy';
    let progress_li_html = '';
    for (let pregress_index in data_item.progress) {
        progress_li_html += "<li>" + data_item.progress[pregress_index] + "</li>";
    }

    html_copy = html_copy
        .replace('{name}', data_item.name)
        .replace('{class}', data_item.class)
        .replace('{gender}', img)
        .replace('{progress}', progress_li_html);


    $('.progress_wrapper').animate({opacity:0}, 450, () => {
        document.querySelector(".progress_wrapper").innerHTML = html_copy;
        $('.progress_wrapper').animate({opacity:1}, 300);
    });
}