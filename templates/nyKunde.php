<form method="post">
    <input class="form-control rounded-0" type="text" name="kundenavn" placeholder="Kundenavn" required></input><br>
    <input class="form-control rounded-0" type="email" name="email" placeholder="E-mail" required></input><br>
    <input class="form-control rounded-0" type="tel" minlength="8" maxlength="8" name="telefonnummer" placeholder="Telefonnummer" required></input><br>
    <input class="form-control rounded-0" type="text" name="adresse" placeholder="Adresse" required></input><br>
    <input class="form-control rounded-0" type="tel"  minlength="4" maxlength="4" name="postnummer" placeholder="Postnummer" required></input><br>
    <input class="form-control rounded-0" type="tel" minlength="8" maxlength="8" name="cvr" placeholder="CVR" required></input><br>
    <button type="submit" name="nyKunde">Opret kunde</button>
</form>
<?php

if(isset($_POST['nyKunde'])){
    $kundenavn = $_POST['kundenavn'];
    $email = $_POST['email'];
    $telefonnummer = $_POST['telefonnummer'];
    $_SESSION['kundeTelefonnummer'] = $telefonnummer;
    $adresse = $_POST['adresse'];
    $postnummer = $_POST['postnummer'];
    $cvr = $_POST['cvr'];
    $brugerid = $_SESSION['bruger']['bruger_id'];
    
    $sql = "INSERT INTO kunde (kundenavn, CVR, adresse, postnummer, email, telefonnummer, butikstilhørsforhold) VALUES ('$kundenavn', '$cvr', '$adresse', '$postnummer', '$email', '$telefonnummer', '$brugerid');";
    $result = mysqli_query($conn, $sql);
    echo "Kunde oprettet, du vidersendes til oprettelse af abonnement";
    header('refresh:2;url=./index.php?nav=nytAbonnement');
}

?>