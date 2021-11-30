<form method="post">
    <input type="tel" name="telefonnummer" placeholder="Telefonnummer" required>
    <input type="submit" name="btnsubmit" value="Find kunde">
</form>

<?php
if(isset($_POST['btnsubmit'])){
    $telefonnummer = $_POST['telefonnummer'];
    $brugerid = $_SESSION['bruger']['bruger_id'];
    $kundeoplysninger = hentKundeoplysninger($telefonnummer, $brugerid);
    debug($kundeoplysninger);
    if(isset($kundeoplysninger[0]['telefonnummer']) && $telefonnummer == $kundeoplysninger[0]['telefonnummer']){
        
        ?>
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
        <?php foreach($kundeoplysninger as $kundeabonnement){?>
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
    }else{
        echo "Der kunne desværre ikke findes en kunde med dette telefonnummer";
    }
}