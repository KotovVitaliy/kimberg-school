<?php

class UserController extends Controller
{
    protected static $instance;

    public function registration()
    {
        $name = htmlspecialchars($_REQUEST['name']);
        $fname = htmlspecialchars($_REQUEST['fname']);
        $phone = $_REQUEST['phone'];
        $email = $_REQUEST['email'];
        $password = $_REQUEST['password'];

        foreach ([$name, $fname, $email, $password, $phone] as $data) {
            if (strlen($data) < 1) {
                Viewer::echoError('Некоторые поля пустые!');
                return;
            }
        }

        $len = 130;
        if (strlen($name) > $len || strlen($fname) > $len) {
            Viewer::echoError("Имя и фамилия не могут быть длинее {$len} символов.");
            return;
        }

        if (strpos($email, '<') !== false || strpos($email, '>') !== false) {
            Viewer::echoError("Email содержит недопустимые символы.");
            return;
        }

        if (UserModel::getInstance()->isEmailExists($email)) {
            Viewer::echoError("Email '{$email}' уже существует в системе.");
            return;
        }

        $token = $this->generateConfirmToken();
        $user_id = UserModel::getInstance()->addStudent($name, $fname, $email, $password, $phone, $token);

        Mailer::getInstance()->sendConfirmMail($email, $token);
        Authorizer::authUser($user_id);

        Viewer::echoSuccess('Регистрация прошла успешно!');
        return;
    }

    public function login()
    {
        $email = $_REQUEST['email'];
        $password = $_REQUEST['password'];

        foreach ([$email, $password] as $data) {
            if (strlen($data) < 1) {
                Viewer::echoError('Некоторые поля пустые!');
                return;
            }
        }
        
        $user = UserModel::getInstance()->getUserByEmailAndPassword($email, $password);
        if (!$user) {
            Viewer::echoError('Нет пользователя с такими данными!');
            return;
        }

        Authorizer::authUser($user['id']);
    }
    
    public function confirm()
    {
        $token = $_REQUEST['confirm'];
        $user = UserModel::getInstance()->getUserByConfirmToken($token);
        $result = UserModel::getInstance()->confirmUserByToken($token);
        if ($result && $user) {
            Mailer::getInstance()->sendGreetingsMailMail($user['email']);
            Authorizer::authUser($user['id']);
            return true;
        }
        return false;
    }

    public function logout()
    {
        Authorizer::logout();
    }

    public function whoAmI($data)
    {
        if (is_int($data)) {
            $user_id = $data;
            $user = UserModel::getInstance()->getUserById($user_id);
        } else if (strpos($data, '@') !== false) {
            $email = $data;
            $user = UserModel::getInstance()->getUserByEmail($email);
        } else {
            return false;
            //todo error
        }

        return $user;
    }

    private function generateConfirmToken()
    {
        return md5(time() * rand(1, 44));
    }
}