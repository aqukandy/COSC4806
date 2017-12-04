<?php

class Util{
    public static function getHome(){
        return HOME;
    }
    
    public static function userLogin(){
        return USER_LOGIN;
    }
    
    public static function userLogout(){
        return LOGOUT;
    }
    
    public static function report(){
        return REPORT;
    }
    
    public static function phoneList(){
        return PHONE_LIST;
    }
    
    public static function isAdmin(){
        $user = $_SESSION['user'];
        
        if($user->role == 'admin') return true;
    }
    
    public static function addUser(){
        return USER_ADD;
    }
    
    public static function deleteUser(){
        return USER_DELETE;
    }
    
    /** CLIENT PART **/
    public static function addClient(){
        return CLIENT_ADD;
    }
    
    public static function editClient(){
        return CLIENT_EDIT;
    }
    
    public static function updateClient(){
        return CLIENT_UPDATE;
    }
}

