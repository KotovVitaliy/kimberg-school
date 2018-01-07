<?php

class DB
{
    private static $DB;

    /**@var PDO*/
    private $connect;
    private static $host;
    private static $name;
    private static $login;
    private static $password;

    private function __construct($connect)
    {
        $this->connect = $connect;
    }

    public static function getInstance()
    {
        if (is_null(self::$DB)) {
            try {
                self::loadConnectDataFromConfig();
                $connect = new PDO(
                    'mysql:host=' . self::$host .';dbname=' . self::$name,
                    self::$login,
                    self::$password,
                    [
                        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                        PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"
                    ]
                );
                self::$DB = new self($connect);
            } catch (PDOException $e) {
                print "Error!: " . $e->getMessage() . "<br/>";
                exit;
            }
        }
        return self::$DB;
    }

    public function query($query)
    {
        $stm = $this->connect->prepare($query);
        $stm->execute();
        return $stm->fetch();
    }

    public function selectAsAssoc($query, array $params = array())
    {
        $stm = $this->connect->prepare($query);
        $stm->execute($params);
        return $stm->fetchAll(PDO::FETCH_ASSOC);
    }

    public function insert($table_name, array $data)
    {
        $query = 'insert into ' . $table_name;
        $keys = [];
        $values = [];
        foreach ($data as $key => $val) {
            $keys[] = '`' . $key . '`';
            $values[] = ':' . $key;
        }
        $query .= '(' . implode(',', $keys) . ')';
        $query .= ' values (' . implode(',', $values) . ')';
        $stm = $this->connect->prepare($query);
        $stm->execute($data);
        return $this->connect->lastInsertId();
    }

    public function update($query, array $params = array())
    {
        $stm = $this->connect->prepare($query);
        $stm->execute($params);
    }

    public function delete($query, array $params = array())
    {
        $stm = $this->connect->prepare($query);
        $stm->execute($params);
    }

    private static function loadConnectDataFromConfig()
    {
        $file = __DIR__ . '/../.config';
        if (!is_file($file)) {
            print "Error!: Cannot get config file.";
            exit;
        } else if (!($data = simplexml_load_file($file))) {
            print "Error!: Cannot parse config file.";
            exit;
        }
        self::$password = (string)$data->password;
        self::$host = (string)$data->host;
        self::$login = (string)$data->login;
        self::$name = (string)$data->name;
    }
}
