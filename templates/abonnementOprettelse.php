<?php
$brugerid = $_SESSION['bruger']['bruger_id'];
$telefonnummer = $_SESSION['kundeTelefonnummer'];
$kundeOplysninger = hentKunde($telefonnummer);
$abonnementer = hentAbonnementer();
$kundeabonnementer = hentKundeoplysninger($telefonnummer, $brugerid);

?>

<form method="post">
    <select name="abonnementtype">
        <?php foreach($abonnementer as $abonnement){?>
        <option value="<?php echo $abonnement['abonnement_id']?>"><?php echo $abonnement['abonnementtype']?></option>
        <?php } ?>
    </select>
    <input type="number" name="antal" placeholder="Antal">
    <input type="submit" name="btnsubmit" value="Opret abonnement">
</form>
<p> Aktive abonnementer</p>
<table class="table table-striped">
    <thead>
        <tr>
            <th scope="col">KundeNavn</th>
            <th scope="col">abonnement</th>
            <th scope="col">antal</th>
            <th scope="col">Pris pr. måned</th>
            <th scope="col">Udleveret tøj</th>
            <th scope="col">Regninger betalt</th>
        </tr>
        <?php foreach($kundeabonnementer as $kundeabonnement){?>
        <tr>
            <td><?php echo $kundeabonnement["kundenavn"] ?></td>
            <td><?php echo $kundeabonnement["abonnementtype"] ?></td>
            <td><?php echo $kundeabonnement["antal"] ?></td>
            <td><?php echo $kundeabonnement["styk_pris"] * $kundeabonnement["antal"] ?></td>
            <td><?php echo $kundeabonnement["udleveret_tøj"] ?></td>
            <td><?php if($kundeabonnement["regninger_betalt"] == 1){echo "GODKENDT";}else{echo "AFVENTER";} ?></td>
        </tr>
        <?php } ?>
    </thead>

<?php
if(isset($_POST['btnsubmit'])){
    $abonnementtype = $_POST['abonnementtype'];
    $antal = $_POST['antal'];
    $kundeid = $kundeOplysninger[0]['kunde_id'];
    foreach($kundeabonnementer as $kundeabonnement){
        if($kundeabonnement['abonnement_id'] == $abonnementtype){
        echo "Dette abonnemnet er allerede oprettet for kunden";
        break;
        } else{
        $sql = "INSERT INTO kunde_abonnementer (kunde_id, abonnement_id, antal) VALUES ('$kundeid', '$abonnementtype', '$antal');";
        $result = mysqli_query($conn, $sql);
        echo "abonnement er oprettet, siden vil opdateres";
        header('refresh:2');
        break;
        }
    }
}
?>