<?php

define('DS', DIRECTORY_SEPARATOR);
define('ROOT', dirname(__DIR__));
define('APPS', ROOT . DS . 'app');
define('CORE', ROOT . DS . 'core');

//User define
define('HOME', '/cosc4806/public');
define('REGISTER', HOME . DS . 'usercontroller/add');
define('USER_DELETE', HOME . DS . 'usercontroller/delete');
define('USER_LOGIN', HOME . DS . 'usercontroller/login');
define('LOGIN', HOME . DS . 'home/login');
define('LOGOUT', HOME . DS . 'usercontroller/logout');
define('USER_ADD', HOME . DS . 'usercontroller/add');
define('REPORT', HOME . DS . 'usercontroller/report');
define('PHONE_LIST', HOME . DS . 'usercontroller/phoneList');
define('MANAGE_CLIENT', HOME . DS . 'usercontroller/manageClient');

//Client part
define('CLIENT_ADD',    HOME . DS . 'usercontroller/addClient');
define('CLIENT_EDIT',   HOME . DS . 'usercontroller/editClient');
define('CLIENT_UPDATE', HOME . DS . 'usercontroller/updateClient');

//Database info
define('DB_HOST'    , '127.0.0.1');
define('DB_USER'    , 'root');
define('DB_PASS'    , '');
define('DB_DATABASE', 'cosc4806');
define('DB_PORT'    , '3306');