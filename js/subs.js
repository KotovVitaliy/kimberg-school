let tpl_data = `
            <tr class="single_row" id="{id}">
                <td>{surname}</td>
                <td>{name}</td>
                <td>{subject}</td>
                <td>{class}</td>
                <td>{school}</td>
                <td>{email_student}</td>
                <td>{email_parent}</td>
                <td>{phone}</td>
                <td>{question}</td>
                <td><button class="{status}" id="{id}">{status}</button></td>
                <td><button class="delete" id="{id}">Удалить</button></td>
            </tr>
`;


$(document).ready(function() {
    getData();

    function getData(by, order) {
        if (!by) by = 'timestamp';
        $.post('/ajax/get_all_subs',{order_by:by,order:order}).done(function(data) {
            data = JSON.parse(data).result;
            drawData(data);
        });
    }

    function drawData(data) {
        $('tr.single_row').remove();
        let table = $('.app>.data>tbody');

        data.forEach(function(el) {
            let html = tpl_data;
            html = html
                .replace(/{id}/g, el.id)
                .replace('{surname}', el.surname)
                .replace('{name}', el.name)
                .replace('{subject}', el.subject)
                .replace('{class}', el.class)
                .replace('{school}', el.school)
                .replace('{email_student}', el.email_student)
                .replace('{email_parent}', el.email_parent)
                .replace('{phone}', el.phone)
                .replace('{question}', el.question)
                .replace(/{status}/g, el.status);

            table.append(html);
        });
    }

    let last_by;
    let last_order = 'asc';
    $('.table_head').on('click', function() {
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