let last_by;
let last_order = 'asc';
let tpl_data = `
            <tr class="single_row" id="{id}">
                <td>{number}</td>
                <td>{surname}</td>
                <td>{name}</td>
                <td>{subject}</td>
                <td>{class}</td>
                <td>{school}</td>
                <td>{email_student}</td>
                <td>{email_parent}</td>
                <td>{phone}</td>
                <td>{question}</td>
                <td>{timestamp}</td>
                <td><button class="{status}" id="{id}">{status}</button></td>
                <td><button class="delete" id="{id}">Удалить</button></td>
            </tr>
`;

function drawYears() {
    let current_year = new Date().getFullYear();
    let next_year = current_year + 1;
    let first_year = 2020;
    let pairs = [];

    let draw_year = first_year;
    while (draw_year < next_year) {
        pairs.push(draw_year + " - " + (draw_year + 1));
        ++draw_year;
    }

    let target = $('div#years');
    pairs.forEach(function(i) {
        target.append("<div data-year='" + i + "' class='year button'>" + i + "</div>");
    });
}

function getData(by, order) {
    if (!by) {
        by = 'timestamp';
    }

    let years = window.localStorage.getItem("years");
    if (!years || years === "") {
        let current_year = new Date().getFullYear();
        let next_year = current_year + 1;
        years = current_year + " - " + next_year;
    }
    $("div.year").removeClass("active");
    $("[data-year='" + years + "']").addClass("active");

    $('tr.single_row').remove();
    let table = $('.app>.data>tbody');
    table.html("<tr><td>loading...</td></tr>");

    $.post('/ajax/get_all_subs',{order_by:by,order:order,years:years}).done(function(data) {
        data = JSON.parse(data).result;
        drawData(data);
    });
}

function drawData(data) {
    let html = `
         <tr>
            <th class="table_head no_sort" id="number">№</th>
            <th class="table_head" id="surname">Фамилия</th>
            <th class="table_head" id="name">Имя</th>
            <th class="table_head" id="subject">Дисциплина</th>
            <th class="table_head" id="class">Класс</th>
            <th class="table_head" id="school">Школа</th>
            <th class="table_head" id="email_student">Email студента</th>
            <th class="table_head" id="email_parent">Email родителя</th>
            <th class="table_head" id="phone">Телефон</th>
            <th class="table_head" id="question">Текст</th>
            <th class="table_head no_sort" id="timestamp">Время записи</th>
            <th class="table_head" id="status">Статус</th>
            <th></th>
        </tr>
    `;

    let counter = 1;
    data.forEach(function(el) {
        let row_html = tpl_data;
        row_html = row_html
            .replace(/{id}/g, el.id)
            .replace('{number}', counter)
            .replace('{surname}', el.surname)
            .replace('{name}', el.name)
            .replace('{subject}', el.subject)
            .replace('{class}', el.class)
            .replace('{school}', el.school)
            .replace('{timestamp}', el.timestamp)
            .replace('{email_student}', el.email_student)
            .replace('{email_parent}', el.email_parent)
            .replace('{phone}', el.phone)
            .replace('{question}', el.question)
            .replace(/{status}/g, el.status);
        ++counter;
        html += row_html;
    });

    let table = $('.app>.data>tbody');
    table.html(html);
}

$(document).ready(function() {
    drawYears();
    getData();

    $(document).on('click', '.year', function () {
        let years = $(this).data('year');
        $("div.year").removeClass("active");
        $("[data-year='" + years + "']").addClass("active");
        window.localStorage.setItem("years", years);
        getData();
    });

    $(document).on('click', '.table_head:not(.no_sort)', function() {
        let by = $(this).attr('id');
        let order = (by !== last_by) ? 'asc' : (last_order === 'asc') ? 'desc' : 'asc';
        last_by = by;
        last_order = order;
        getData(by, order);
    });

    $(document).on('click', 'button.new', function() {
        let id = $(this).attr('id');
        $.post('/ajax/update_sub_status',{id:id,status:'seen'});
        $(this).removeClass('new').addClass('seen').text('seen');
    });

    $(document).on('click', 'button.seen', function() {
        let id = $(this).attr('id');
        $.post('/ajax/update_sub_status',{id:id,status:'new'});
        $(this).removeClass('seen').addClass('new').text('new');
    });

    $(document).on('click', 'button.delete', function() {
        let id = $(this).attr('id');
        $.post('/ajax/delete_sub',{id:id});
        $('tr.single_row#' + id).remove();
    });
});