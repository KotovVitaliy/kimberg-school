<?php

class User
{
    const ROLE_TEACHER = 'teacher';
    const ROLE_STUDENT = 'student';
    const ROLE_PARENT = 'parent';

    private
        $id,
        $name,
        $fname,
        $role,
        $email,
        $password,
        $vk_id,
        $inst_id,
        $photo_id,
        $current_class,
        $created,
        $confirm_token,
        $is_confirmed,
        $forgot_token;

    public function __construct(
        $id,
        $name,
        $fname,
        $role,
        $email,
        $password,
        $vk_id,
        $inst_id,
        $photo_id,
        $current_class,
        $created,
        $confirm_token,
        $is_confirmed,
        $forgot_token
    )
    {
        $this->id = $id;
        $this->name = $name;
        $this->fname = $fname;
        $this->role = $role;
        $this->email = $email;
        $this->password = $password;
        $this->vk_id = $vk_id;
        $this->inst_id = $inst_id;
        $this->photo_id = $photo_id;
        $this->current_class = $current_class;
        $this->created = $created;
        $this->confirm_token = $confirm_token;
        $this->is_confirmed = $is_confirmed;
        $this->forgot_token = $forgot_token;
    }

    public function getId()
    {
        return $this->id;
    }

    public function getName()
    {
        return $this->name;
    }

    public function getFname()
    {
        return $this->fname;
    }

    public function getRole()
    {
        return $this->role;
    }

    public function getEmail()
    {
        return $this->email;
    }

    public function getPassword()
    {
        return $this->password;
    }

    public function getVkId()
    {
        return $this->vk_id;
    }

    public function isConfirmed()
    {
        return $this->is_confirmed;
    }

    public function getConfirmToken()
    {
        return $this->confirm_token;
    }
}
