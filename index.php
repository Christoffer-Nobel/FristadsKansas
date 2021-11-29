<?php
session_start();
include('conn.php');
include('functions.php');
connect();
include("header.php");
$employee[0]['forhandler'] = NULL;
if(isset($_SESSION['employee']) && $_SESSION['employee']['forhandler'] == 1){
    include('customerNav.php');
}elseif(isset($_SESSION['employee']) && $_SESSION['employee']['forhandler'] == 0){
    include('mainNav.php');
}else{
    ?>
    <form method="post">
        <h1>Login</h1>
        <input type="text" name="username" placeholder="Brugernavn" required><br>
        <input type="password" name="password" placeholder="Kodeord" required><br>
        <input type="submit" name="btnlogin" value="Login">
    </form>
    <?php
    if(isset($_POST['btnlogin']))
    {
    $username = $_POST['username'];
    $password = $_POST['password'];
                    
    $employee = getEmployee($username);
    if(isset($employee)){
            if($_POST['password'] == $employee[0]['kodeord']){
                $_SESSION['employee'] = $employee[0];  
                header("Refresh:0");
            }else{
                echo "Kode eller brugernavn er forkert";
            }
        }else{
            echo "Kode eller brugernavn er forkert";
        }  
    }
}
include("footer.php");
