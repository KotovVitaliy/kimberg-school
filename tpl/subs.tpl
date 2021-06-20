<html>
<head>
    <title>Subs</title>
    <script type="text/javascript" src="/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/js/subs.js"></script>
    <style>
        /* cyrillic */
        @font-face {
            font-family: 'Open Sans';
            font-style: normal;
            font-weight: 400;
            src: local('Open Sans'), local('OpenSans'), url(/css/sans.woff2) format('woff2');
            unicode-range: U+0400-045F, U+0490-0491, U+04B0-04B1, U+2116;
        }
        /* latin */
        @font-face {
            font-family: 'Open Sans';
            font-style: normal;
            font-weight: 400;
            src: local('Open Sans'), local('OpenSans'), url(/css/sans.woff2) format('woff2');
            unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2212, U+2215, U+E0FF, U+EFFD, U+F000;
        }
        /*DEFAULT*/

        body, html {
            margin: 0;
            padding: 0;
            font-family: 'Open Sans';
        }
        .app {
            padding: 5px;
        }
        .data {
            border-spacing: 0;
            border: 1px solid gainsboro;
        }
        .data th, .data td {
            padding: 15px;
            width: 150px;
            text-align: left;
            margin: 0;
        }
        table.data tr:nth-child(2n) {
            background-color: gainsboro;
        }
        .data th {
            font-weight: bold;
            cursor: pointer;
        }
        div#years {
        }
        div.button {
            display: inline-block;
            padding: 10px;
            margin: 5px 5px 5px 0;
            border: 1px solid cornflowerblue;
            background-color: cornflowerblue;
            color: whitesmoke;
            cursor: pointer;
            border-radius: 5px;
        }
        div.button:hover {
            background-color: whitesmoke;
            color: black;
        }
        div.active {
            background-color: whitesmoke;
            color: black;
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
        <h3>Выбрать год:</h3>
        <div id="years"></div>

        <hr>

        <table class="data">
            <tbody>
                <tr><td>loading...</td></tr>
            </tbody>
        </table>
    </div>
</body>
</html>