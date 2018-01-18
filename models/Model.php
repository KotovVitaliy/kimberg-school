<?php

class Model
{
    protected static $instance;
    protected $DB;

    protected function __construct()
    {
        $this->DB = DB::getInstance();
    }

    /**
     * @return static
     */
    public static function getInstance()
    {
        if (is_null(static::$instance)) {
            static::$instance = new static();
        }
        return static::$instance;
    }
}
