<?php

class User{
    public $username;
    public $password;
    public $role;
    public $managedBy;
    
    public function __construct(){}
    
    public function authenticate(){
        $db = db_connect();
        $statement = $db->prepare("select * from tbl_user where username = :username");
        $statement->bindValue(':username', $this->username);
        $statement->execute();
        $rows = $statement->fetchAll(PDO::FETCH_ASSOC);
        if($rows){
            $crypted_pass = $rows[0]['password'];
            if(crypt($this->password,$crypted_pass) == $crypted_pass){
                $_SESSION['username'] = $rows[0]['username'];
                $_SESSION['role'] = $rows[0]['role'];
                return true;
            }
        }
        return false;
    }
    
    public function perform($action, $user){
        if($action == 'add') $this->add($user);
        else if($action == 'delete') $this->delete ($user);
        else if($action == 'update') $this->update($user);
    }
    
    private function add($user){
        $db = db_connect();
        $statement = $db->prepare("INSERT INTO tbl_user values(:username, :password, :role, :managedBy);");
        $statement->bindValue(':username', $user->username);
        $statement->bindValue(':password', $user->password);
        $statement->bindValue(':role', $user->role);
        $statement->bindValue(':managedBy', $user->managedBy);
        $statement->execute();
    }
    
    private function delete($user){
        $db = db_connect();
        $statement = $db->prepare("delete from tbl_user where username = :username");
        $statement->bindValue(':username', $user->username);
        $statement->execute();
    }
    
    public function getUsers(){
        $db = db_connect();
        $statement = $db->prepare("select * from tbl_user where role != 'admin'");
        $statement->bindValue(':role', 'manager');
        $statement->execute();
        $rows = $statement->fetchAll(PDO::FETCH_ASSOC);
        return $rows;
    }
}