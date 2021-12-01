<?php
 $telefonnummer = $_SESSION['kundeTelefonnummer'];
 $brugerid = $_SESSION['bruger']['bruger_id'];

 $kundeoplysninger = hentKundeoplysninger($telefonnummer, $brugerid);

?>
<table class="table table-striped">
    <thead>
        <tr>
            <th scope="col">Kundenavn</th>
            <th scope="col">Abonnement ID</th>
            <th scope="col">Abonnement</th>
            <th scope="col">Antal</th>
            <th scope="col">Pris pr. måned</th>
            <th scope="col">Udleveret tøj</th>
            <th scope="col">Regninger betalt</th>
        </tr>
        <?php foreach($kundeoplysninger as $kundeabonnement){?>
        <tr>
            <td><?php echo $kundeabonnement["kundenavn"] ?></td>
            <td><?php echo $kundeabonnement["kunde_abonnement_id"] ?></td>
            <td><?php echo $kundeabonnement["abonnementtype"] ?></td>
            <td><?php echo $kundeabonnement["antal"] ?></td>
            <td><?php echo $kundeabonnement["styk_pris"] * $kundeabonnement["antal"] ?></td>
            <td><?php echo $kundeabonnement["udleveret_tøj"] ?></td>
            <td><?php if($kundeabonnement["regninger_betalt"] == 1){echo "GODKENDT";}else{echo "AFVENTER";} ?></td>
        </tr>
        <?php } ?>
    </thead>
    
        <p>Tilføj net nyt stykke tøj ved at scanne tøjets tag, eller indtast id</p><br>
        <p>**Vælg først hvilket abonnement produktet skal tiføjees til</p>
        <form method="post">
            <select class="form-control rounded-0" name="abonnementid">
                <?php foreach($kundeoplysninger as $kundeabonnement){?>
                <option value="<?php echo $kundeabonnement['kunde_abonnement_id']?>"><?php echo $kundeabonnement['kunde_abonnement_id']?></option>
                <?php } ?>
            </select>
            <input class="form-control rounded-0" type="number" name="tøjid" placeholder="Indtast id her" required>
            <button class="form-control rounded-0 btn btn-primary" type="submit" name="btntøjudlevering">Tilføj produkt til abonnement</button>
        </form>
        <?php
        if(isset($_POST['btntøjudlevering'])){
            $abonnementid = $_POST['abonnementid'];
            $tøjid = $_POST['tøjid'];
            $udleveretTøj = hentUdleveretTøj($abonnementid);
            $nyUdleveretTøj = $udleveretTøj[0]['udleveret_tøj'] + 1;
            $sql = "UPDATE kunde_abonnementer SET udleveret_tøj = '". $nyUdleveretTøj . "' WHERE kunde_abonnement_id = '" . $_POST['abonnementid'] ."'";
            $result = mysqli_query($conn, $sql);
            header('refresh:0');
        
        }