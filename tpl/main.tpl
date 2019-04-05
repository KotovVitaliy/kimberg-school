<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Школа Кимберг</title>
    <meta name="author" content="Котов Виталий Игоревич">
    <meta name="description" content="Школа олимпиадной физики">
    <meta name="keywords" content="олимпиады физика подготовка к олимпиадам егэ сдать репититор">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="format-detection" content="telephone=no">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700&amp;subset=cyrillic" rel="stylesheet">
    <link rel="stylesheet" href="/css/styles.css">
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
    <link rel="manifest" href="/manifest.json">
    <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5">
    <meta name="theme-color" content="#ffffff">
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/main.js"></script>
</head>
<body>
<div id="first-block">
    <div id="menu-block">
        <div class="in-block">
            <header>
                <div id="nav-container">
                    <nav class="common-nav">
                        <a href="#how-to-start">Обучение</a>
                        <a href="#teachers">Преподаватели</a>
                        <a href="#contacts">Контакты</a>
                        <a href="#feedback">Отзывы</a>
                        <a href="#faq">Частые вопросы</a>
                        <a id="social_menu">Соцсети</a>
                    </nav>
                    <nav class="social-nav">
                        <a onclick="sendStatVK()" href="https://vk.com/club160387658" target="_blank"><img src="/img/vk.png" alt="VK"> ВКонтакте</a>
                        <a onclick="sendStatInstagram()" href="https://www.instagram.com/kimberg.school/" target="_blank"><img src="/img/instagram.png" alt="INSTAGRAM"> Instagram</a>
                        <a onclick="sendStatYoutube()" href="https://www.youtube.com/channel/UC5CPHWez8h8XZZH_RxcoNOg" target="_blank"><img src="/img/youtube.png" alt="YOUTUBE"> YouTube</a>

                        <a id="back_social_menu">Меню</a>
                    </nav>
                </div>
                <div id="phone-container">
                    <div id="phone"><a class="nolink" href="tel:+7 (926) 886-54-97">+7 (926) 886-54-97</a></div>
                    <!--<div id="sign-links"> текст под телефоном </div>-->
                </div>
            </header>
        </div>
    </div>
    <div id="intro-block">
        <div class="in-block" id="intro-container">
            <h1 id="school-name">
                <span>Школа</span>
                <br>
                <span>Кимберг</span>
            </h1>
            <div id="school-about">
                <div id="about-items">
                    <div>Подготовка к ЕГЭ</div>
                    <div>Подготовка к олимпиадам</div>
                    <div>Подготовка к поступлению в&nbsp;ведущие&nbsp;ВУЗы&nbsp;страны</div>
                </div>
                <div class="button-container">
                    <button onclick="sendSubscribe1()" class="subscribe-link">Записаться</button>
                </div>
                <br />
                <div class="button-container">
                    <button onclick="sendOpenSchedule()" class="schedule alternative">Расписание</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="how-to-start" class="headed-block">
    <div class="in-block">
        <h2>Как начать обучение</h2>
        <div id="stages-list">
            <div id="stage-container-1">
                <div id="stage-1">Выберите педагога</div>
            </div>
            <div id="stage-container-2">
                <div id="stage-2">
                    <span>Запишитесь на занятия</span>
                    <br />
                    <span>(1 занятие &ndash; 120 мин.)</span>
                </div>
            </div>
            <div id="stage-container-3">
                <div id="stage-3">
                    <span>Оплатите обучение</span>
                    <!--<br />
                    <span>(1 занятие - 2 500 ₽)</span>-->
                </div>
            </div>
            <div id="stage-container-4">
                <div id="stage-4">
                    <span>Приходите на занятия</span>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="account-contents">
    <div class="in-block">
        <h2>В процессе обучения вас ждет:</h2>
        <div id="contents-list">
            <div><span>1.</span>Интенсивные занятия в маленьких группах, где каждый получает море внимания</div>
            <div><span>2.</span>Структурированный план для штурма самых крутых олимпиад</div>
            <!-- <div><span>3.</span>Доступ к видео-лекциям, чтобы наверняка не упустить ни крохи знаний</div> -->
            <div><span>3.</span>Домашние задания,чтобы не скучать в перерывах между занятиями</div>
            <div><span>4.</span>Станешь частью тусовки таких же «ненормальных» как ты</div>
        </div>
        <div id="start-learning">
            <button onclick="sendSubscribe2()" class="subscribe-link">Начать обучение</button>
        </div>
        <div id="notebook-container">
            <img src="/img/notebook.png" alt="" />
        </div>
    </div>
</div>
<div id="teachers" class="headed-block">
    <div class="in-block">
        <h2>Преподаватели</h2>
        <div class="teacher-container left-oriented">
            <div class="photo-container">
                <!-- Фотография должна быть квадратная, размером не менее 165*165px -->
                <img src="/img/photo_kimberg.jpg" alt="Ян Кимберг" />
                <div class="photo-mask"></div>
            </div>
            <div class="text-container">
                <h3>Ян Кимберг</h3>
                <div class="description">
                    <p>Если ты хочешь научиться решать действительно интересные, олимпиадные задачи, то ты по адресу. Ты не только постигнешь «Джедайские» приемы, позволяющие щелкать задачи в пару строчек, но и сделаешь это в непринужденной атмосфере дружеского общения и шуток-прибауток.</p>

                    <p>Пару слов о себе:</p>
                    <ul>
                        <li>Выпускник физического факультета МГУ;</li>
                        <li>Тренер сборной Москвы по физике;</li>
                        <li>Лауреат Гранта правительства Москвы в сфере образования;</li>
                        <li>Руководитель сборной Москвы на Румынской физической олимпиаде (Romanian masters of Physics);</li>
                        <li>Руководитель сборной Москвы на международной Жаутыковской олимпиаде (IZho);</li>
                        <li>Руководитель сборной Москвы на международной олимпиаде по экспериментальной физике (IEpho);</li>
                        <li>Член жюри Московской городской олимпиады;</li>
                        <li>Преподаватель образовательных программ «Путь к Олимпу»;</li>
                        <li>Сотрудник Центра педагогического мастерства.</li>
                    </ul>

                    <p>Опыт преподавания: 7 лет, в том числе в СУНЦ МГУ, школе №1329, лицее Воробьевы Горы. Подготовка Московской сборной к Всероссийской олимпиаде школьников, преподавание в олимпиадных выездных школах (Сочи, Истра, Беларусь, Иркутск).</p>

                    <p>Записывайся, стань машиной по решению задач!</p>
                </div>

                <p><a onclick="sendStatYoutubeYan()" href="https://www.youtube.com/watch?v=2BmtKeF06qE" target="_blank"><button>Интервью Яна</button></a></p>
            </div>
        </div>

        <div class="teacher-container right-oriented">
            <div class="photo-container">
                <!-- Фотография должна быть квадратная, размером не менее 165*165px -->
                <img src="/img/photo_parinov.jpg" alt="Данила Паринов" />
                <div class="photo-mask"></div>
            </div>
            <div class="text-container">
                <h3>Данила Паринов</h3>
                <div class="description">
                    <p>На мой взгляд, для успешного решения задач по физике (а это точно нужно уметь, если хочешь 100 баллов на экзамене или «затащить» пару-тройку олимпиад) нужно «видеть» задачу: хорошо понимать суть физических явлений, положенных в её основу.</p>

                    <p>Я хочу, чтобы после моих занятий ученики получали удовольствие от решения сложных и нестандартных задач. Ведь если ты понимаешь «суть» физики, то ни одна незнакомая задача не вызовет ступор или панику.</p>

                    <p>Коротко о себе: выпускник ФОПФ МФТИ (бакалавриат) и физического факультета МГУ (магистратура). Победитель всероссийских олимпиад школьников по физике (2009-2011), медалист международных олимпиад (золото на WoPhO-2012 и APhO-2011, серебро на IPhO-2011).</p>

                    <p>Член жюри:</p>

                    <ul>
                        <li>Всероссийской олимпиады школьников;</li>
                        <li>Московской олимпиады школьников;</li>
                        <li>Международной олимпиады по экспериментальной физике;</li>
                        <li>Международной олимпиады мегаполисов.</li>
                    </ul>

                    <p>Опыт преподавания: 7 лет, в том числе в СУНЦ МГУ, школе №1329, подготовка Московской сборной к Всероссийской олимпиаде школьников, преподавание в олимпиадных выездных школах (Сочи, Истра, Беларусь).</p>
                </div>

                <p><a onclick="sendStatYoutubeDan()" href="https://www.youtube.com/watch?v=1WJuQyJn6lg" target="_blank"><button>Интервью Данила</button></a></p>
            </div>
        </div>

        <div class="teacher-container left-oriented">
            <div class="photo-container">
                <!-- Фотография должна быть квадратная, размером не менее 165*165px -->
                <img src="/img/photo_trushinikov.jpg" alt="Николай Трушников" />
                <div class="photo-mask"></div>
            </div>
            <div class="text-container">
                <h3>Николай Трушников</h3>
                <div class="description">
                    <p>В изучении физики главное &ndash; не зазубрить сотню-другую формул, случаи их применения и варианты ответов, ведь с этим всегда лучше справится компьютер. Главное &ndash; осознать, что все явления вокруг нас взаимосвязаны, научиться видеть эти связи и описывать даже самые сложные процессы наиболее простыми методами.</p>

                    <p>Моя цель &ndash; помочь ученику «глубоко» разобраться в теме, научить осознанно решать разнообразные задачи и, как следствие, добиться хороших результатов на олимпиадах и экзаменах.</p>

                    <p>Немного о себе:
                    <ul>
                        <li>Закончил физический факультет МГУ;</li>
                        <li>Тренер сборной г. Москвы;</li>
                        <li>Член жюри и автор задач МОШ по физике;</li>
                        <li>Член жюри региональных этапов ВсОШ и олимпиады «Максвелл»;</li>
                        <li>Член жюри Азиатской физической олимпиады (APhO);</li>
                        <li>Член жюри международной экспериментальной физической олимпиады (IEPhO);</li>
                        <li>Член жюри и автор задач международной олимпиады Мегаполисов.</li>
                    </ul>

                    <p>Записывайтесь, увидимся на занятиях!</p>

                    <p><a onclick="sendStatYoutubeNick()" href="https://www.youtube.com/watch?v=e3FmWhuqspo" target="_blank"><button>Интервью Николая</button></a></p>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="feedback" class="headed-block">
    <div class="in-block">
        <h2>Отзывы</h2>
        <div class="feedback left-oriented">
            <img align="left" src="/img/feedback_1.png" alt="" />
            <p class="feedback_header">Алексей Шешуков <span class="feedback_time">17 июня 2018</span></p>
            <p class="feedback_body">Ян Сергеевич мощный препод, умеющий заинтересовать в предмете и очень (очень-очень) понятно объяснить материал. Ходил на уроки как на праздник.</p>
        </div>
        <div class="feedback right-oriented">
            <img align="left" src="/img/feedback_2.png" alt="" />
            <p class="feedback_header">Максим Бельских <span class="feedback_time">17 июня 2018</span></p>
            <p class="feedback_body">Хотите знать физику, тогда вы по адресу. Ян Сергеевич - отличный преподаватель, который вам с этим поможет.</p>
        </div>
        <div class="feedback left-oriented">
            <img align="left" src="/img/feedback_1.png" alt="" />
            <p class="feedback_header">Александр Крылов <span class="feedback_time">19 июня 2018</span></p>
            <p class="feedback_body">Если я скажу, что Ян Сергеевич - сильный преподаватель, способный не только объяснить свой предмет, но и заинтересовать в нем, то опишу лишь четвертую часть учителя, однако даже этого достаточно, чтобы считать его одним из лучших.</p>
        </div>
        <div class="feedback right-oriented">
            <img align="left" src="/img/feedback_2.png" alt="" />
            <p class="feedback_header">Кирилл Лобанов <span class="feedback_time">04 авг 2018</span></p>
            <p class="feedback_body">Красивые задачи, заставляющие подумать над решением и понятный разбор этих задач. Рай для ботанов. :)
            </p>
        </div>

        <div>
            <a href="https://vk.com/topic-160387658_38711385" target="_blank"><button onclick="sendSeeFeedback()">Смотреть все отзывы на VK</button></a>
        </div>
    </div>
</div>

<div id="faq">
    <div class="in-block">
        <h2>Вопросы и ответы:</h2>
        <div id="contents-list">
            <div class="faq_item">
                <div><span>Q.</span>Где территориально проходят занятия?</div>
                <div><span>A.</span>Тетеринский пер. 4, стр. 1, офис 402. Рядом со станцией метро Таганская кольцевая.</div>
                <div><span>A.</span><a class="black-link bold" target="_blank" href="https://yandex.ru/maps/213/moscow/?ll=37.654256%2C55.743607&z=17&mode=search&text=%D0%A2%D0%B5%D1%82%D0%B5%D1%80%D0%B8%D0%BD%D1%81%D0%BA%D0%B8%D0%B9%20%D0%BF%D0%B5%D1%80.%204%2C%20%D1%81%D1%82%D1%80.%201&sll=37.620393%2C55.753960&sspn=1.689148%2C0.662947">Открыть на карте</a>.</div>
            </div>

            <div class="faq_item">
                <div><span>Q.</span>Сколько раз в неделю проходят занятия?</div>
                <div><span>A.</span>Занятие проходят один раз в неделю в выбранной группе. Возможны два занятия в случае необходимости интенсива.</div>
            </div>

            <div class="faq_item">
                <div><span>Q.</span>В какие дни и в какое время проходят занятия?</div>
                <div><span>A.</span>Занятия планируются в выходные дни, но есть возможность набора групп на занятия по будням.</div>
            </div>

            <div class="faq_item">
                <div><span>Q.</span>Сгорает ли оплата в случае болезни?</div>
                <div><span>A.</span>В случае болезни оплаченное занятие переносится на следующий месяц.</div>
            </div>

            <div class="faq_item show">
                <div><span>Q.</span>Сколько человек в группе?</div>
                <div><span>A.</span>В группе от 4 до 6 человек.</div>
            </div>

            <div class="faq_item show">
                <div><span>Q.</span>Можно ли присоединиться к группе в любой момент?</div>
                <div><span>A.</span>Для наибольшей эффективности занятий желательно определиться <strong>к середине сентября</strong>. Но возможность включиться в работу в процессе тоже будет, в случае свободных мест в группах.</div>
            </div>

            <div class="faq_item show">
                <div><span>Q.</span>Если группа с прицелом на Всероссийскую олимпиаду, то это подготовка к теоретическому этапу или к практике тоже?</div>
                <div><span>A.</span>Если группа по подготовке к ВсОШ, то упор на теорию. Но консультация по практическому этапу возможна. Надо будет это персонально обсуждать с педагогом.</div>
            </div>

            <div class="faq_item show">
                <div><span>Q.</span>В группе идет подготовка исключительно к выбранному направлению (олимпиада или ЕГЭ) или ко всему сразу?</div>
                <div><span>A.</span>Подготовка идет только по выбранному направлению. Есть возможность посещать две группы.</div>
            </div>

            <div class="faq_item show">
                <div><span>Q.</span>Пока не начались занятия, чем можно заняться, чтобы вспомнить что такое физика?</div>
                <div><span>A.</span>Вступить в нашу <a class="black-link bold" href="https://vk.com/kimberg.school">группу в VK</a>, где есть интересный материал и будет появляться самая свежая информация.</div>
                <div><span>A.</span>Подписаться на <a class="black-link bold" href="https://www.youtube.com/c/KimbergSchool">наш канал на Youtube</a> для доступа ко всем имеющимся видеоматериалам.</div>
            </div>

        </div>
        <div id="faq-question">
            <button onclick="sendSubscribe4()" class="subscribe-link">Задать вопрос</button>
        </div>
        <div id="show-more-question">
            <button onclick="sendShowFaq()" class="show-more-button">Показать все вопросы</button>
        </div>
        <div id="faq-container">
            <img src="/img/questions.png" alt="" />
        </div>
    </div>
</div>

<div id="contacts" class="headed-block">
    <div class="in-block" id="contacts-container">
        <h2>Контакты</h2>
        <div id="contacts-list">
            <div id="contact-mail"><a class="black-link" href="mailto:kimberg.school@gmail.com">kimberg.school@gmail.com</a></div>
            <div id="contact-phone"><a class="black-link nolink" href="tel:+7 (926) 886-54-97">+7 (926) 886-54-97</a></div>
        </div>
        <div id="contacts-button">
            <button onclick="sendSubscribe3()" class="subscribe-link">Связаться</button>
        </div>
    </div>
</div>
<footer>
    <div class="in-block" id="footer-block">
        <div id="credentials">
            © Школа Кимберг<span class="nowrap">, 2017-<span id="currentYear"></span></span>
        </div>
        <div id="social-links">
            <a onclick="sendStatVK()" href="https://vk.com/club160387658" target="_blank"><img src="/img/vk.png" alt="VK"></a>
            <a onclick="sendStatInstagram()" href="https://www.instagram.com/kimberg.school/" target="_blank"><img src="/img/instagram.png" alt="INSTAGRAM"></a>
            <a onclick="sendStatYoutube()" href="https://www.youtube.com/channel/UC5CPHWez8h8XZZH_RxcoNOg" target="_blank"><img src="/img/youtube.png" alt="YOUTUBE"></a>
            <a href="#first-block" id="up-button" title="Наверх"><img src="/img/arrow-up-2.png" alt="Наверх"></a>
        </div>
    </div>
</footer>

<div id="subscribe-container" class="form-container">
    <div class="form">
        <div class="close"></div>
        <h1>Заполните форму</h1>
        <form id="subscribe-form" data-url="user">
            <div class="form-error"></div>
            <div class="form-success"></div>
            <div class="form-row">
                <label>Фамилия<i class="necessarily"></i> :</label>
                <input name="surname" type="text" value="">
            </div>
            <div class="form-row">
                <label>Имя<i class="necessarily"></i> :</label>
                <input name="name" type="text" value="">
            </div>
            <div class="form-row">
                <label>Класс<i class="necessarily"></i> :</label>
                <select name="class">
                    <option value="">Выбрать</option>
                    <option value="7">7 класс</option>
                    <option value="8">8 класс</option>
                    <option value="9">9 класс</option>
                    <option value="10">10 класс</option>
                    <option value="11">11 класс</option>
                </select>
            </div>
            <div class="form-row">
                <label>E-mail<i class="necessarily"></i> :</label>
                <input name="email" type="text" value="">
            </div>
            <div class="form-row">
                <label>Номер телефона:</label>
                <input name="phone" type="tel" placeholder="+7 (900) 123-4567" value="" class="novalidate">
            </div>
            <div class="form-row">
                <label>Комментарий:</label>
                <textarea name="question" class="novalidate"></textarea>
            </div>
            <button type="submit">ОТПРАВИТЬ</button>
        </form>
    </div>
</div>

<div id="schedule-container" class="form-container">
    <div class="schedule-wrap">
        <img class="schedule-img" src="/img/Schedule.png" alt="Расписание">
    </div>
</div>

<!-- <div id="auth-form-container" class="form-container">
    <div class="form">
        <div class="close"></div>
        <h1>Авторизация</h1>
        <form id="auth-form" data-url="/user/login">
            <div class="form-error"></div>
            <div class="form-row">
                <label>E-mail:</label>
                <input name="email" type="text" value="">
            </div>
            <div class="form-row">
                <label>Пароль:</label>
                <input name="password" class="novalidate" type="password" value="">
            </div>
            <div class="form-link">
                <a href="#" id="restore-link">Забыли пароль?</a>
            </div>
            <button type="submit">ВОЙТИ</button>
        </form>
    </div>
</div>

<div id="restore-form-container" class="form-container">
    <div class="form">
        <div class="close"></div>
        <h1>Забыли пароль?</h1>
        <form id="restore-form" data-url="/user/forgot">
            <div class="form-intro">
                Введите ваш e-mail в поле ниже.<br>
                Мы вышлем вам инструкцию по смене пароля
            </div>
            <div class="form-error"></div>
            <div class="form-row">
                <label>E-mail:</label>
                <input name="email" type="text" value="">
            </div>
            <button type="submit">ОТПРАВИТЬ</button>
        </form>
    </div>
</div>

<div id="register-form-container" class="form-container">
    <div class="form">
        <div class="close"></div>
        <h1>Регистрация</h1>
        <form id="register-form" data-url="/user/registration">
            <div class="form-error"></div>
            <div class="form-row">
                <label>Имя:</label>
                <input name="name" type="text" value="">
            </div>
            <div class="form-row">
                <label>Фамилия:</label>
                <input name="fname" type="text" value="">
            </div>
            <div class="form-row">
                <label>Телефон:</label>
                <input name="phone" type="text" value="">
            </div>
            <div class="form-row">
                <label>E-mail:</label>
                <input name="email" type="text" value="">
            </div>
            <div class="form-row">
                <label>Пароль:</label>
                <input name="password" type="password" value="">
            </div>
            <button type="submit">ОТПРАВИТЬ</button>
        </form>
    </div>
</div>

<div id="question-form-container" class="form-container">
    <div class="form">
        <div class="close"></div>
        <h1>Задать вопрос</h1>
        <form id="question-form" data-url="/user/question">
            <div class="form-error"></div>
            <div class="form-row">
                <label>Имя:</label>
                <input name="name" type="text" value="">
            </div>
            <div class="form-row">
                <label>E-mail:</label>
                <input name="email" type="text" value="">
            </div>
            <div class="form-row">
                <label>Вопрос:</label>
                <textarea name="question"></textarea>
            </div>
            <button type="submit">ОТПРАВИТЬ</button>
        </form>
    </div>
</div> -->

</body>
</html>