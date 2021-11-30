<form method="post">
    <input type="tel" name="telefonnummer" placeholder="Telefonnummer" required>
    <input type="submit" name="btnsubmit" value="Find kunde">
</form>

<?php
if(isset($_POST['btnsubmit'])){
    $telefonnummer = $_POST['telefonnummer'];
    $_SESSION['kundeTelefonnummer'] = $telefonnummer;
    $brugerid = $_SESSION['bruger']['bruger_id'];
    $kundeoplysninger = hentKundeoplysninger($telefonnummer, $brugerid);
    if(isset($kundeoplysninger[0]['telefonnummer']) && $telefonnummer == $kundeoplysninger[0]['telefonnummer']){
        header('location:./index.php?nav=redigeringAfKundeoplysninger');

    }else{
        echo "Der kunne desværre ikke findes en kunde med dette telefonnummer";
    }
}