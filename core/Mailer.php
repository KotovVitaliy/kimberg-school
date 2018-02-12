<?php
class Mailer
{
    const CONFIRM_EMAIL = 'confirm@' . Config::DOMAIN;
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
