<?php
class Mailer
{
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

    public function sendMail($data)
    {
        if (isset($data['a']) && $data['a'] == "intensive") {
            $this->sendIntensiveMail($data);
        } else {
            $this->sendSubscribeMail($data);
        }
    }

    public function sendSubscribeMail($data)
    {
        $surname = $data['surname'] ?? 'нет';
        $name = $data['name'] ?? 'нет';

        $subjects = $data['subjects'] ?? ['нет'];
        $subjects = $this->replaceSubjects($subjects);

        $school = $data['school'] ?? 'нет';
        $class = $data['class'] ?? 'нет';
        $email_student = $data['email_student'] ?? 'нет';
        $email_parent = $data['email_parent'] ?? 'нет';
        $phone = isset($data['phone']) && $data['phone'] ? $data['phone'] : 'нет';
        $question = isset($data['question']) && $data['question'] ? ("<< " . $data['question'] . " >>") : 'нет';

        $message = 'С портала Школа Кимберг пришла новая заявка:' . PHP_EOL;
        $message .= "Фамилия: {$surname}" . PHP_EOL;
        $message .= "Имя: {$name}" . PHP_EOL;
        $message .= "Школа: {$school}" . PHP_EOL;
        $message .= "Класс: {$class}" . PHP_EOL;
        $message .= "Дисциплины: " . implode(', ', $subjects) . PHP_EOL;
        $message .= "Email ученика: {$email_student}" . PHP_EOL;
        $message .= "Email родителя: {$email_parent}" . PHP_EOL;
        $message .= "Номер телефона: {$phone}" . PHP_EOL;
        $message .= "Сообщение: {$question}" . PHP_EOL;
        $message .= PHP_EOL . 'Не забудь связаться с человеком. Твой дружелюбный сосед, Email Robot.' . PHP_EOL;
        $subject = 'Kimberg School - Subscribe';
        $from = self::SUBSCRIBE_EMAIL;
        $this->_sendMail("kimberg.school@gmail.com", $subject, $message, $from);
        $this->_sendMail("nizkopal@mail.ru", $subject, $message, $from);
        $this->sendConfirmMail($email_student, $email_parent);
    }

    public function sendIntensiveMail($data)
    {
        $surname = $data['surname'] ?? 'нет';
        $name = $data['name'] ?? 'нет';

        $class = $data['class'] ?? 'нет';
        $email_student = $data['email_student'] ?? 'нет';
        $email_parent = $data['email_parent'] ?? 'нет';
        $phone = isset($data['phone']) && $data['phone'] ? $data['phone'] : 'нет';
        $format = $data['format'] ?? 'нет';
        $smena = $data['smena'] ?? 'нет';
        $question = isset($data['question']) && $data['question'] ? ("<< " . $data['question'] . " >>") : 'нет';

        $message = 'С портала Школа Кимберг пришла новая заявка:' . PHP_EOL;
        $message .= "Фамилия: {$surname}" . PHP_EOL;
        $message .= "Имя: {$name}" . PHP_EOL;
        $message .= "Класс: {$class}" . PHP_EOL;
        $message .= "Смена: {$smena}" . PHP_EOL;
        $message .= "Email ученика: {$email_student}" . PHP_EOL;
        $message .= "Email родителя: {$email_parent}" . PHP_EOL;
        $message .= "Номер телефона: {$phone}" . PHP_EOL;
        $message .= "Формат: {$format}" . PHP_EOL;
        $message .= "Сообщение: {$question}" . PHP_EOL;
        $message .= PHP_EOL . 'Не забудь связаться с человеком. Твой дружелюбный сосед, Email Robot.' . PHP_EOL;
        $subject = 'Kimberg School - Интенсивы';
        $from = self::SUBSCRIBE_EMAIL;
        $this->_sendMail("kimberg.school@gmail.com", $subject, $message, $from);
        $this->_sendMail("nizkopal@mail.ru", $subject, $message, $from);
        $this->sendConfirmMail($email_student, $email_parent);
    }

    public function sendConfirmMail($email_student, $email_parent)
    {
        $subject = "Welcome to Kimberg School";
        $from = self::SUBSCRIBE_EMAIL;

        $message = "Доброго времени суток." . PHP_EOL . PHP_EOL;
        $message .= "Ваша заявка принята! Спасибо, что выбрали нас.";

        $this->_sendMail($email_student, $subject, $message, $from);
        $this->_sendMail($email_parent, $subject, $message, $from);
    }

    public function replaceSubjects(array $subjects)
    {
        $map = [
            'eg' => 'ЕГЭ онлайн',
            'theory' => 'Теория',
            'theory_online' => 'Теория онлайн',
            'prac' => 'Практикум',
            'math_methods' => 'Методы мат. физики'
        ];

        $new_subjects = [];
        foreach ($subjects as $sub) {
            $new_subjects[] = $map[$sub] ?? 'Неизвестное значение';
        }

        return $new_subjects;
    }

    private function _sendMail($to, $subject, $message, $from)
    {
        $headers = $this->_prepareHeaders($from);
        $message = $this->_addSign($message);
        return mail($to, $subject, $message, $headers, "-f{$from}");
    }

    private function _prepareHeaders($from)
    {
        $add_headers = 'From: Kimberg School <' . $from . '>' . "\r\n";
        $add_headers .= 'Reply-To: ' . self::NO_REPLY_EMAIL . "\r\n";
        return $add_headers;
    }

    private function _addSign($message)
    {
        return $message . "\n\n------\nKimberg School\nhttp://kimberg-school.com";
    }
}
