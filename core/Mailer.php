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

    public function sendSubscribeMail($data)
    {
        $surname = $data['surname'] ?? 'нет';
        $name = $data['name'] ?? 'нет';
        $school_number = $data['school_number'] ?? 'нет';
        $class = $data['class'] ?? 'нет';
        $email = $data['email'] ?? 'нет';
        $adds = $data['adds'] ?? 'нет';
        $phone = isset($data['phone']) && $data['phone'] ? $data['phone'] : 'нет';
        $text = isset($data['question']) && $data['question'] ? ("<< " . $data['question'] . " >>") : 'нет';

        $message = 'С портала Школа Кимберг пришла новая заявка:' . PHP_EOL;
        $message .= "Фамилия: {$surname}" . PHP_EOL;
        $message .= "Имя: {$name}" . PHP_EOL;
        $message .= "Удобный адрес: {$adds}" . PHP_EOL;
        $message .= "Школа: {$school_number}" . PHP_EOL;
        $message .= "Класс: {$class}" . PHP_EOL;
        $message .= "Email: {$email}" . PHP_EOL;
        $message .= "Номер телефона: {$phone}" . PHP_EOL;
        $message .= "Сообщение: {$text}" . PHP_EOL;
        $message .= PHP_EOL . 'Не забудь связаться с человеком. Твой дружелюбный сосед, Email Robot.' . PHP_EOL;
        $subject = 'Kimberg School - Subscribe';
        $from = self::SUBSCRIBE_EMAIL;
        $this->_sendMail("kimberg.school@gmail.com", $subject, $message, $from);
        return $this->_sendMail("nizkopal@mail.ru", $subject, $message, $from);
    }

    public function sendPromoMail($data)
    {
        $surname = $data['surname'] ?? 'нет';
        $name = $data['name'] ?? 'нет';
        $class = $data['class'] ?? 'нет';
        $email = $data['email'] ?? 'нет';
        $school = $data['school_number'] ?? 'нет';

        $phone = isset($data['phone']) && $data['phone'] ? $data['phone'] : 'нет';
        $text = isset($data['question']) && $data['question'] ? ("<< " . $data['question'] . " >>") : 'нет';

        $message = 'С портала Школа Кимберг пришла заявка на ПРАКТИКУМ:' . PHP_EOL;
        $message .= "Фамилия: {$surname}" . PHP_EOL;
        $message .= "Имя: {$name}" . PHP_EOL;
        $message .= "Класс: {$class}" . PHP_EOL;
        $message .= "Школа: {$school}" . PHP_EOL;
        $message .= "Email: {$email}" . PHP_EOL;
        $message .= "Номер телефона: {$phone}" . PHP_EOL;
        $message .= "Достижения: {$text}" . PHP_EOL;
        $message .= PHP_EOL . 'Не забудь связаться с человеком. Твой дружелюбный сосед, Email Robot.' . PHP_EOL;
        $subject = 'Kimberg School - ПРАКТИКУМ';
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
