<?php
class Mailer
{
    const CONFIRM_EMAIL = 'confirm@' . Config::DOMAIN;
    const SUBSCRIBE_EMAIL = 'subscribe@' . Config::DOMAIN;
    const NO_REPLY_EMAIL = 'no-reply@' . Config::DOMAIN;

    private static $instance;

    public static function getInstance()
    {
        if (is_null(self::$instance)) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function sendConfirmMail($email, $confirm_token)
    {
        $confirm_link = Config::DOMAIN_SCHEME . '/confirm/' . $confirm_token;
        $message = "Вы создали аккаунт на " . Config::DOMAIN . "!\n";
        $message .= 'Чтобы подтвердить, что это Ваш email, пожалуйста, перейдите по ссылке: ' . $confirm_link . "\n";
        $message .= 'Если Вы не создавали аккаунт, просто проигнорируйте это сообщение, Вас больше не побеспокоят.';
        $subject = 'Регистрация на портале Школа Кимберг';
        $from = self::CONFIRM_EMAIL;
        return $this->_sendMail($email, $subject, $message, $from);
    }

    public function sendGreetingsMailMail($email)
    {
        $message = 'Добро пожаловать на портал Школы Кимберг' . PHP_EOL;
        $message .= 'Ваш email был успешно подтвержден.' . PHP_EOL;
        $message .= 'После того, как Вы заполните все необходимые данные о себе, Вам станет доступны все возможности портала.' . PHP_EOL;
        $subject = 'Добро пожаловать на портал Школа Кимберг';
        $from = self::CONFIRM_EMAIL;
        return $this->_sendMail($email, $subject, $message, $from);
    }

    public function sendSubscribeMail($data)
    {
        $surname = $data['surname'] ?? 'нет';
        $name = $data['name'] ?? 'нет';
        $class = $data['class'] ?? 'нет';
        $email = $data['email'] ?? 'нет';
        $phone = isset($data['phone']) && $data['phone'] ? $data['phone'] : 'нет';
        $text = isset($data['question']) && $data['question'] ? ("<< " . $data['question'] . " >>") : 'нет';

        $message = 'С портала Школа Кимберг пришла новая заявка:' . PHP_EOL;
        $message .= "Фамилия: {$surname}" . PHP_EOL;
        $message .= "Имя: {$name}" . PHP_EOL;
        $message .= "Класс: {$class}" . PHP_EOL;
        $message .= "Email: {$email}" . PHP_EOL;
        $message .= "Номер телефона: {$phone}" . PHP_EOL;
        $message .= "Сообщение: {$text}" . PHP_EOL;
        $message .= PHP_EOL . 'Не забудь связаться с человеком. Твой дружелюбный сосед, Email Robot.' . PHP_EOL;
        $subject = 'Новое сообщение с сайта Kimberg School';
        $from = self::SUBSCRIBE_EMAIL;
        $this->_sendMail("kimberg.school@gmail.com", $subject, $message, $from);
        return $this->_sendMail("nizkopal@mail.ru", $subject, $message, $from);
    }

    private function _sendMail($to, $subject, $message, $from)
    {
        $headers = $this->_prepareHeaders($from);
        $message = $this->_addSign($message);
        return mail($to, $subject, $message, $headers, "-f{$from}");
    }

    private function _prepareHeaders($from)
    {
        $add_headers = 'From: Школа Кимберг <' . $from . '>' . "\r\n";
        $add_headers .= 'Reply-To: ' . self::NO_REPLY_EMAIL . "\r\n";
        return $add_headers;
    }

    private function _addSign($message)
    {
        return $message . "\n\n------\nШкола Кимберг\nhttp://kimberg-school.com";
    }
}
