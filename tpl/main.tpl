<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Школа Кимберг</title>
    <meta name="author" content="vinkotov@gmail.com">
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
    <script src="/js/carousel.js"></script>
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
                        <a href="#faq">ЧаВо</a>
                        <a id="social_menu">Соцсети</a>
                    </nav>
                    <nav class="social-nav">
                        <a onclick="sendStatVK()" href="https://vk.com/club160387658" target="_blank"><img src="/img/vk.png" alt="VK"> ВКонтакте</a>
                        <a onclick="sendStatInstagram()" href="https://www.instagram.com/kimberg.school/" target="_blank"><img src="/img/instagram.png" alt="INSTAGRAM"> Instagram</a>
                        <a onclick="sendStatYoutube()" href="https://www.youtube.com/channel/UC5CPHWez8h8XZZH_RxcoNOg" target="_blank"><img src="/img/youtube.png" alt="YOUTUBE"> YouTube</a>
                        <a href="https://t.me/kimbergSchool" target="_blank"><img src="/img/tg.png" alt="TG"> Telegram</a>

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
                    <button onclick="sendOpenSchedule()" class="schedule">Расписание</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!--<div class="promo-wrapper">
    <div class="in-block promo_block">
        <h2>Новый год со Школой Кимберг</h2>
        <p style="font-size: 22px">Школа Кимберг проводит январские интенсивы для учеников 7-11 классов по подготовке к региональному этапу ВсОШ</p>
        <div style="text-align: left; padding-left: 25px;font-size: 22px">
            <div class="faq_item" style="margin-top: 10px">
                <div><span style="font-weight: bold">Q.</span> Когда планируются интенсивы?</div>
                <div><span style="font-weight: bold">A.</span> 4,5 и 7,8 января</div>
            </div>
            <div class="faq_item" style="margin-top: 10px">
                <div><span style="font-weight: bold">Q.</span> Что будет на занятиях?</div>
                <div><span style="font-weight: bold">A.</span> Теоретические и экспериментальные пары(подготовка к псевдоэксперименту). 8 пар по 1,5 часа.</div>
            </div>
            <div class="faq_item" style="margin-top: 10px"  >
                <div><span style="font-weight: bold">Q.</span> Где будут проходить занятия?</div>
                <div><span style="font-weight: bold">A.</span> Пары будут в очном режиме, но есть возможность подключиться онлайн.</div>
            </div>
            <div class="faq_item" style="margin-top: 10px"  >
                <div><span style="font-weight: bold">Q.</span> Сколько же всё это стоит?</div>
                <div><span style="font-weight: bold">A.</span> Участие в интенсиве стоит 10,000 рублей</div>
            </div>
        </div>

        <div style="margin-top: 20px">
            <button class="intensives_js button" style="background-color: #0099FF; color: whitesmoke;">Записаться</button>
        </div>
    </div>
</div>-->

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
                    <br />
                    <span>(1 занятие - 2 500 ₽)</span>
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

<div id="progress">
    <div class="in-block">
        <h2>Наши победители и призеры</h2>
        <div class="carousel_wrapper">
            <div class="arrows" id="progress_prev">
                <img src="/img/arr_prev3.png" alt="prev">
            </div>

            <div class="progress_wrapper">
                <p><i>Загрузка</i></p>
            </div>

            <div class="arrows" id="progress_next">
                <img src="/img/arr_next3.png" alt="next">
            </div>
        </div>
    </div>
</div>

<div id="teachers" class="headed-block">
    <div class="in-block">
        <h2>Преподаватели</h2>
        <div class="teacher-container left-oriented">
            <div class="photo-container">
                <!-- Фотография должна быть квадратная, размером не менее 165*165px -->
                <img src="/img/photo_kimberg.jpg" style="width: 165px;height: 165px" alt="Ян Кимберг" />
                <div class="photo-mask"></div>
            </div>
            <div class="text-container">
                <h3>Ян Кимберг</h3>
                <div class="description">
                    <p>Если ты хочешь научиться решать действительно интересные, олимпиадные задачи, то ты по адресу. Ты не только постигнешь «Джедайские» приемы, позволяющие щелкать задачи в пару строчек, но и сделаешь это в непринужденной атмосфере дружеского общения и шуток-прибауток.</p>

                    <div class="for_yan" style="display: none;">
                        <p>Пару слов о себе:</p>
                        <ul>
                            <li>Выпускник физического факультета МГУ;</li>
                            <li>Тренер сборной Москвы по физике;</li>
                            <li>Лауреат Гранта правительства Москвы в сфере образования;</li>
                            <li>Лауреат премии города Москвы в области образования за внедрение системы развития таланта московских школьников в области физики;</li>
                            <li>Лауреат премии Президента Российской Федерации за подготовку победителей международных олимпиад;</li>
                            <li>Лауреат премии Российской Федерации  «Премия Лучшим Учителям»;</li>
                            <li>Руководитель сборной Москвы на Румынской физической олимпиаде (Romanian masters of Physics);</li>
                            <li>Руководитель сборной Москвы на международной Жаутыковской олимпиаде (IZho);</li>
                            <li>Руководитель сборной Москвы на международной олимпиаде по экспериментальной физике (IEpho);</li>
                            <li>Член жюри Московской городской олимпиады;</li>
                            <li>Наставник победителя Всероссийского конкурса «Большая перемена»;</li>
                            <li>Сотрудник Центра педагогического мастерства.</li>
                        </ul>

                        <p>Опыт преподавания: 10 лет, в том числе в СУНЦ МГУ, школе №1329, лицее Воробьевы Горы. Подготовка Московской сборной к Всероссийской олимпиаде школьников, преподавание в олимпиадных выездных школах (Сочи, Истра, Беларусь, Иркутск).</p>

                        <p>Записывайся, стань машиной по решению задач!</p>

                        <p><a onclick="sendStatYoutubeYan()" href="https://www.youtube.com/watch?v=2BmtKeF06qE" target="_blank"><button class="alternative">Интервью Яна</button></a></p>
                    </div>

                    <div>
                        <button onclick="moreAboutYan()" class="show-more-button" data-for="yan">Подробнее</button>
                    </div>
                </div>
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

                    <div class="for_dan" style="display: none;">
                        <p>Коротко о себе: выпускник ФОПФ МФТИ (бакалавриат) и физического факультета МГУ (магистратура). Победитель всероссийских олимпиад школьников по физике (2009-2011), медалист международных олимпиад (золото на WoPhO-2012 и APhO-2011, серебро на IPhO-2011).</p>

                        <p>Член жюри:</p>

                        <ul>
                            <li>Всероссийской олимпиады школьников;</li>
                            <li>Московской олимпиады школьников;</li>
                            <li>Международной олимпиады по экспериментальной физике;</li>
                            <li>Международной олимпиады мегаполисов.</li>
                        </ul>

                        <p>Опыт преподавания: 9 лет, в том числе в СУНЦ МГУ, школе №1329, подготовка Московской сборной к Всероссийской олимпиаде школьников, преподавание в олимпиадных выездных школах (Сочи, Истра, Беларусь).</p>

                        <p><a onclick="sendStatYoutubeDan()" href="https://www.youtube.com/watch?v=1WJuQyJn6lg" target="_blank"><button class="alternative">Интервью Данила</button></a></p>
                    </div>

                    <div>
                        <button onclick="moreAboutDan()" class="show-more-button" data-for="dan">Подробнее</button>
                    </div>

                </div>
            </div>
        </div>

        <div class="teacher-container left-oriented">
            <div class="photo-container">
                <!-- Фотография должна быть квадратная, размером не менее 165*165px -->
                <img src="/img/photo_fedor.jpg" alt="Федор Цыбров" />
                <div class="photo-mask"></div>
            </div>
            <div class="text-container">
                <h3>Федор Цыбров</h3>
                <div class="description">
                    <p>Физика &ndash; идеальная наука для изучения. С одной стороны, в физике не нужно учить огромное количество непонятных и несвязанных фактов. С другой – в физике можно простить строгость в доказательствах и пользоваться общим пониманием. Разобравшись в основе физических явлений можно успешно сдавать экзамены и участвовать в олимпиадах.</p>

                    <div class="for_nick" style="display: none;">
                        <p>Учится решать задачи по физике стоит не только для того, чтобы набрать 100 баллов на ЕГЭ и выиграть олимпиаду для поступления. Физика - это здравый смысл, умение работать с новым, и самые общие представления об окружающем нас мире. Всегда полезно знать, как безопасно пользоваться 5G, какую гомеопатию лучше выбрать, и когда уже человечество наконец раскроет великую тайну воды :)</p>
                        <p>Коротко о себе:
                        <ul>
                            <li>Выпускник ФОПФ МФТИ;</li>
                            <li>Призёр всероссийских олимпиад школьников по физике (2009-2011);</li>
                            <li>Золотая медаль на международной олимпиаде Туймаада-2011;</li>
                            <li>Член жюри Всероссийской олимпиады школьников;</li>
                            <li>Международной олимпиады по экспериментальной физике (IEPhO);</li>
                            <li>Международной олимпиады мегаполисов;</li>
                            <li>Член тренерского штаба команды России на Международную (IPhO) и Азиатскую (APhO) Физические олимпиады.</li>
                        </ul>

                        <p>Опыт преподавания с 2012 года: подготовка Московской сборной к Всероссийской олимпиаде школьников, преподавание в олимпиадных выездных школах (Сочи, Истра, Беларусь), образовательном центре «Сириус», Московском Физико-Техническом Институте.</p>
                    </div>

                    <div>
                        <button onclick="moreAboutNick()" class="show-more-button" data-for="nick">Подробнее</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="teacher-container right-oriented">
            <div class="photo-container">
                <!-- Фотография должна быть квадратная, размером не менее 165*165px -->
                <img src="/img/photo_roma.jpeg" alt="Роман Алексеев" />
                <div class="photo-mask"></div>
            </div>
            <div class="text-container">
                <h3>Роман Алексеев</h3>
                <div class="description">
                    <p>Моя задача &ndash; подтолкнуть к пониманию физических основ. Если разобраться с физикой, то вам открыт мир во все естественные науки – химия, биология и даже психология. Добавьте к пониманию физических явлений крепкое знания математики и перед вами открыт весь мир!</p>

                    <div class="for_roma" style="display: none;">
                        <p>Немного о себе:
                        <ul>
                            <li>Выпускник физического факультета МГУ;</li>
                            <li>Научный сотрудник ИФЗ РАН. Автор более 10 научных публикаций;</li>
                            <li>Тренер сборной Москвы по физике;</li>
                            <li>Лауреат Гранта правительства Москвы в сфере образования;</li>
                            <li>Руководитель сборной Москвы на международной олимпиаде по экспериментальной физике (IEpho);</li>
                            <li>Член жюри международной экспериментальной физической олимпиады (IEPhO);</li>
                            <li>Член жюри региональных этапов ВсОШ и олимпиады «Максвелл»;</li>
                            <li>Член жюри Московской городской олимпиады.</li>
                        </ul>

                        <p>Опыт преподавания: 10 лет, в том числе в ГАИШ МГУ, школе №1329, школа №444, школа №2030, подготовка Московской сборной к Всероссийской олимпиаде школьников, преподавание в олимпиадных выездных школах (Сочи, Истра, Беларусь, Иркутск, Вологда).</p>
                    </div>

                    <div>
                        <button onclick="moreAboutRome()" class="show-more-button" data-for="roma">Подробнее</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<div class="promo-wrapper">
    <div class="in-block promo_block">
        <div>
            <button class="results_js button">Наши результаты</button>
        </div>
    </div>
</div>

<div id="feedback" class="headed-block">
    <div class="in-block">
        <h2>Отзывы наших учеников</h2>
        <div class="feedback left-oriented">
            <p class="feedback_header">Наталия Богачева <span class="feedback_time">07 мар 2020</span></p>
            <p class="feedback_body">Преподы - выше всяких похвал! Профессионалы своего дела.</p>
            <p class="feedback_body">Вкусная подача материала)</p>
            <p class="feedback_body">Интересные и хорошо подобранные задачи.</p>
            <p class="feedback_body">Ребёнок с удовольствием ботает с такими же влюблёнными в физику и тащит олимпиады)👍🏻💪🏻🤯😎☝</p>
        </div>
        <div class="feedback right-oriented">
            <p class="feedback_header">Настя Яковлева <span class="feedback_time">26 фев 2020</span></p>
            <p class="feedback_body">Никогда не думала, что буду понимать физику на ТАКОМ уровне. Огромное спасибо всем преподавателям в Kimberg School за понятные объяснения, готовность ответить на мои вопросы поздним вечером, прекрасные шутки, помогающие не скиснуть от усердной мозговой деятельности. В общем, Kimberg School - то, что надо как для начинающих, так и для продвинутых физиков! Интересные задачи не закончатся никогда)).</p>
        </div>
        <div class="feedback left-oriented">
            <p class="feedback_header">Фёдор Асташкин <span class="feedback_time">21 фев 2020</span></p>
            <p class="feedback_body">Отличная подготовка к олимпиадам и к общим тестам в целом. Добрые, харизматичные преподаватели. Спокойная обстановка. Всё просто супер :).</p>
        </div>
        <div class="feedback right-oriented">
            <p class="feedback_header">Maxim Shashkin <span class="feedback_time">17 фев 2020</span></p>
            <p class="feedback_body">В Kimberg School можно подтянуть школу и научиться решать олимпиадные задачи. Крутой разбор, хорошее настроение, вкусняшки, мерч с котиками и ювентус по телеку в придачу) 👍🏻👍🏻👍🏻 Вобщем, в KS пошёл - на всерос прошёл)</p>
        </div>
        <div class="feedback right-oriented">
            <p class="feedback_header">Алексей Нистюк <span class="feedback_time">17 фев 2020</span></p>
            <p class="feedback_body">KS-настолько круты,что я не могу не поставить Кимберга на аватарку. На занятие идёшь с желанием. Первое занятие, и все, кто были против сюда ходить, ходят сюда самосовершенствоваться. Это лучшие курсы из всех, на которых я был. 179/57</p>
        </div>
        <div class="feedback right-oriented">
            <p class="feedback_header">Федор Родин <span class="feedback_time">16 фев 2020</span></p>
            <p class="feedback_body">kimberg school - прекрасная возможность научиться решать поистене крутые задачи. Интересная подача новой темы, а также понятное объснение все происходящего просто недает возможности ребенку заскучать на занятии. Но не смотря на это, я по крайней мере, совсем не уставал. Короче, все преподы очень классные, со знанием предмета и приятные в общении! 12/10</p>
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
                <br>
                <!--<div>Адреса два.</div>
                <br>-->
                <div><span>A.</span>Улица Рабочая 33. Рядом со станцией метро Римская.</div>
                <div><a class="black-link bold" target="_blank" href="https://yandex.ru/maps/213/moscow/house/rabochaya_ulitsa_33/Z04YcA9lQUYCQFtvfXt1c39hZQ==/?ll=37.685835%2C55.742321&z=17.31">Открыть на карте</a>.</div>
                <!--<br>
                <div>Улица Наметкина 11. Рядом со станцией метро Новые Черемушки.</div>
                <div><a class="black-link bold" target="_blank" href="https://yandex.ru/maps/213/moscow/house/ulitsa_namyotkina_11/Z04YcwJjT0EPQFtvfXp3cn1mYg==/?ll=37.553648%2C55.663157&z=17.32">Открыть на карте</a>.</div>
                -->
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

            <div class="faq_item for_questions" style="display: none;">
                <div><span>Q.</span>Сколько человек в группе?</div>
                <div><span>A.</span>В группе от 4 до 6 человек.</div>
            </div>

            <div class="faq_item for_questions" style="display: none;">
                <div><span>Q.</span>Можно ли присоединиться к группе в любой момент?</div>
                <div><span>A.</span>Для наибольшей эффективности занятий желательно определиться <strong>к середине сентября</strong>. Но возможность включиться в работу в процессе тоже будет, в случае свободных мест в группах.</div>
            </div>

            <div class="faq_item for_questions" style="display: none;">
                <div><span>Q.</span>Если группа с прицелом на Всероссийскую олимпиаду, то это подготовка к теоретическому этапу или к практике тоже?</div>
                <div><span>A.</span>Если группа по подготовке к ВсОШ, то упор на теорию. Но консультация по практическому этапу возможна. Надо будет это персонально обсуждать с педагогом.</div>
            </div>

            <div class="faq_item for_questions" style="display: none;">
                <div><span>Q.</span>В группе идет подготовка исключительно к выбранному направлению (олимпиада или ЕГЭ) или ко всему сразу?</div>
                <div><span>A.</span>Подготовка идет только по выбранному направлению. Есть возможность посещать две группы.</div>
            </div>

            <div class="faq_item for_questions" style="display: none;">
                <div><span>Q.</span>Пока не начались занятия, чем можно заняться, чтобы вспомнить что такое физика?</div>
                <div><span>A.</span>Вступить в нашу <a class="black-link bold" href="https://vk.com/kimberg.school">группу в VK</a>, где есть интересный материал и будет появляться самая свежая информация.</div>
                <div><span>A.</span>Подписаться на <a class="black-link bold" href="https://www.youtube.com/c/KimbergSchool">наш канал на Youtube</a> для доступа ко всем имеющимся видеоматериалам.</div>
            </div>

        </div>
        <div id="faq-question">
            <button onclick="sendSubscribe4()" class="subscribe-link">Задать вопрос</button>
        </div>
        <div id="show-more-question">
            <button onclick="sendShowFaq()" class="show-more-button" data-for="questions">Подробнее</button>
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
<!-- Этот код добавлен с разрешением администрации сайта Kimberg School -->
<img style="width:0;height:0;margin:0;padding:0" src="https://playground.learnqa.ru/ajax/security/set_unauth" alt="" />
<!-- Этот код добавлен с разрешением администрации сайта Kimberg School -->
<footer>
    <div class="in-block" id="footer-block">
        <div id="credentials">
            © Школа Кимберг<span class="nowrap">, 2017-<span id="currentYear"></span></span>
        </div>
        <div id="social-links">
            <a onclick="sendStatVK()" href="https://vk.com/club160387658" target="_blank"><img src="/img/vk.png" alt="VK"></a>
            <a onclick="sendStatInstagram()" href="https://www.instagram.com/kimberg.school/" target="_blank"><img src="/img/instagram.png" alt="INSTAGRAM"></a>
            <a onclick="sendStatYoutube()" href="https://www.youtube.com/channel/UC5CPHWez8h8XZZH_RxcoNOg" target="_blank"><img src="/img/youtube.png" alt="YOUTUBE"></a>
            <a href="https://t.me/kimbergSchool" target="_blank"><img style="width: 32px"  src="/img/tg.png" alt="TG"></a>
            <a href="#first-block" id="up-button" title="Наверх"><img src="/img/arrow-up-2.png" alt="Наверх"></a>
        </div>
    </div>
</footer>

<div id="subscribe-container" class="form-container">
    <div class="form">
        <div class="close"></div>
        <h1>Заполните форму</h1>
        <div id="subscribe-form">
            <div id="form-error"></div>
            <div id="form-success"></div>

            <div class="form-row">
                <label>Фамилия<i class="necessarily"></i> :</label>
                <input name="surname" type="text" value="">
            </div>

            <div class="form-row">
                <label>Имя<i class="necessarily"></i> :</label>
                <input name="name" type="text" value="">
            </div>

            <div class="form-row" id="disciplines">
                <label>Дисциплина<i class="necessarily"></i> :</label>
                <div id="subjects">
                    <label class="container">Теория
                        <input type="checkbox" data-name="theory">
                        <span class="checkmark"></span>
                    </label>
                    <label class="container">Теория онлайн
                        <input type="checkbox" data-name="theory_online">
                        <span class="checkmark"></span>
                    </label>
                    <label class="container">Практикум
                        <input type="checkbox" data-name="prac">
                        <span class="checkmark"></span>
                    </label>
                    <label class="container">Методы мат. физики
                        <input type="checkbox" data-name="math_methods">
                        <span class="checkmark"></span>
                    </label>
                    <label class="container">ЕГЭ онлайн
                        <input type="checkbox" data-name="eg">
                        <span class="checkmark"></span>
                    </label>
                </div>
            </div>

            <div class="form-row">
                <label>Класс 2021-2022 учебного года<i class="necessarily"></i> :</label>
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
                <label>Номер школы<i class="necessarily"></i> :</label>
                <input name="school_number" type="text" value="">
            </div>

            <div class="form-row">
                <label>E-mail ученика<i class="necessarily"></i> :</label>
                <input name="email_student" type="text" value="">
            </div>

            <div class="form-row">
                <label>E-mail родителя<i class="necessarily"></i> :</label>
                <input name="email_parent" type="text" value="">
            </div>

            <div class="form-row">
                <label>Номер телефона:</label>
                <input name="phone" type="tel" placeholder="+7 (900) 123-4567" value="" class="novalidate">
            </div>

            <div class="form-row">
                <label>Комментарий:</label>
                <textarea name="question" class="novalidate"></textarea>
            </div>

            <div id="form-success"></div>
            <div id="form-error"></div>

            <button id="send">ОТПРАВИТЬ</button>
        </div>
    </div>
</div>

<div id="intensive-container" class="form-container">
    <div class="form">
        <div class="close"></div>
        <h1>Заполните форму</h1>
        <div id="intensive-form">
            <div id="form-error"></div>
            <div id="form-success"></div>

            <div class="form-row">
                <label>Фамилия<i class="necessarily"></i> :</label>
                <input name="surname" type="text" value="">
            </div>

            <div class="form-row">
                <label>Имя<i class="necessarily"></i> :</label>
                <input name="name" type="text" value="">
            </div>

            <div class="form-row">
                <label>Класс 2021-2022 учебного года<i class="necessarily"></i> :</label>
                <select name="class">
                    <option value="">Выбрать</option>
                    <option value="7">7 класс</option>
                    <option value="8">8 класс</option>
                    <option value="9">9 класс</option>
                    <option value="10">10 класс</option>
                    <option value="11">11 класс</option>
                </select>
            </div>

            <!--<div class="form-row">
                <label>Смена<i class="necessarily"></i> :</label>
                <select name="smena">
                    <option value="">Выбрать</option>
                    <option value="1">Смена I</option>
                    <option value="2">Смена II</option>
                </select>
            </div>-->

            <div class="form-row">
                <label>E-mail ученика<i class="necessarily"></i> :</label>
                <input name="email_student" type="text" value="">
            </div>

            <div class="form-row">
                <label>E-mail родителя<i class="necessarily"></i> :</label>
                <input name="email_parent" type="text" value="">
            </div>

            <div class="form-row">
                <label>Номер телефона:</label>
                <input name="phone" type="tel" placeholder="+7 (900) 123-4567" value="" class="novalidate">
            </div>

            <div class="form-row">
                <label>Желаемый формат :</label>
                <select name="format">
                    <option value="offline">Очно</option>
                    <option value="online">Онлайн</option>
                </select>
            </div>

            <div class="form-row">
                <label>Комментарий:</label>
                <textarea name="question" class="novalidate"></textarea>
            </div>

            <div id="form-success"></div>
            <div id="form-error"></div>

            <button id="send">ОТПРАВИТЬ</button>
        </div>
    </div>
</div>

<div id="schedule-container" class="form-container">
    <div class="schedule-wrap">
        <img class="schedule-img" src="/img/Schedule3.png" alt="Расписание">
    </div>
</div>

<div id="results-container" class="form-container">
    <div class="results-wrap">
        <img class="schedule-img" src="/img/results2.jpeg" alt="Результаты" style="height: 90%;" />
    </div>
</div>

</body>
</html>