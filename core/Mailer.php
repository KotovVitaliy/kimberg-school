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
        $message = "You created account on " . Config::DOMAIN . "!\n";
        $message .= 'To confirm your account, please, follow this link ' . $confirm_link . "\n";
        $message .= 'Otherwise do nothing and we won\'t bothering you again.';
        $subject = 'Confirm your registration';
        $from = self::CONFIRM_EMAIL;
        return $this->_sendMail($email, $subject, $message, $from);
    }

    public function sendForgotMail($email, $forgot_token)
    {
        $forgot_link = Config::DOMAIN_SCHEME . '/forgot/' . $forgot_token;
        $message = "To reset password follow this link: " . $forgot_link . "\n";
        $subject = 'Reset password';
        $from = self::NO_REPLY_EMAIL;
        return $this->_sendMail($email, $subject, $message, $from);
    }
    
    public function sendGreetingsMail($email)
    {
        $link = Config::DOMAIN_SCHEME . '/workspace/';
        $message = "Привет, новый ученик.\nТы буквально в одном шаге от того, чтобы знать физику на все сто. Пройди в свой личный кабинет и выбери удобное для занятий время:\n{$link}";
        $subject = 'Добро пожаловать на портал школы Кимберг';
        return $this->_sendMail($email, $subject, $message, self::NO_REPLY_EMAIL);
    }

    private function _sendMail($to, $subject, $message, $from)
    {
        $headers = $this->_prepareHeaders($from);
        return mail($to, $subject, $message, $headers, "-f{$from}");
    }

    private function _prepareHeaders($from)
    {
        $add_headers = 'From: Школа Кимберг <' . $from . '>' . "\r\n";
        $add_headers .= 'Reply-To: ' . self::NO_REPLY_EMAIL . "\r\n";
        return $add_headers;
    }
}
