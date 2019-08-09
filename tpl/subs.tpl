<html>
<head>
    <title>Subs</title>
    <script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/js/subs.js"></script>
    <style>
        .data {marging: 10px;padding:10px;}
        .data th, .data td {
            padding: 15px;
            width: 150px;
            text-align: left;
        }
        .data th {
            font-weight: bold;
            cursor: pointer;
        }
        button {
            padding: 5px;
            margin: 5px;
            border-radius: 3px;
            cursor: pointer;
        }
        button.new {
            background-color: salmon;
            color: whitesmoke;
            border-color: salmon;
        }
        button.seen {
            background-color: cornflowerblue;
            color: whitesmoke;
            border-color: cornflowerblue;
        }
    </style>
</head>
<body>
    <div class="app">
        <table class="data">
            <tbody>
                <tr>
                    <th class="table_head" id="surname">Фамилия</th>
                    <th class="table_head" id="name">Имя</th>
                    <th class="table_head" id="class">Класс</th>
                    <th class="table_head" id="school">Школа</th>
                    <th class="table_head" id="email">Email</th>
                    <th class="table_head" id="text">Текст</th>
                    <th class="table_head" id="type">Тип</th>
                    <th class="table_head" id="comment">Твой комментарий</th>
                    <th class="table_head" id="status">Статус</th>
                    <th></th>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>