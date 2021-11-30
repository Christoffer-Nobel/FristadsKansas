<?php
session_start();
include('conn.php');
include('functions.php');
connect();
include("header.php");
$bruger[0]['forhandler'] = NULL;
if(isset($_SESSION['bruger']) && $_SESSION['bruger']['forhandler'] == 1){
    include('kundeNav.php');
}elseif(isset($_SESSION['bruger']) && $_SESSION['bruger']['forhandler'] == 0){
    include('mainNav.php');
}else{
    ?>
    <form method="post">
        <h1>Login</h1>
        <input type="text" name="brugernavn" placeholder="Brugernavn" required><br>
        <input type="password" name="kodeord" placeholder="Kodeord" required><br>
        <input type="submit" name="btnlogin" value="Login">
    </form>
    <?php
    if(isset($_POST['btnlogin']))
    {
    $brugernavn = $_POST['brugernavn'];
    $kodeord = $_POST['kodeord'];
                    
    $bruger = hentBruger($brugernavn);
        if(isset($bruger)){
                if($_POST['kodeord'] == $bruger[0]['kodeord']){
                    $_SESSION['bruger'] = $bruger[0];  
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
