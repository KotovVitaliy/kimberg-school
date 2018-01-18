<?php

class UserController extends Controller
{
    public function registration()
    {
        $name = $_REQUEST['name'];
        $fname = $_REQUEST['fname'];
        $email = $_REQUEST['email'];
        $password = $_REQUEST['password'];

        foreach ([$name, $fname, $email, $password] as $data) {
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

        if (UserModel::getInstance()->isEmailExists($email)) {
            Viewer::echoError("Email '{$email}' уже существует в системе.");
            return;
        }

        $user_id = UserModel::getInstance()->addStudent($name, $fname, $email, $password);
        Authorizer::authUser($user_id);

        Viewer::echoSuccess('Регистрация прошла успешно!');
        return;
    }

    public function enter()
    {

    }

    public function logout()
    {
        Authorizer::deleteAuth();
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
}