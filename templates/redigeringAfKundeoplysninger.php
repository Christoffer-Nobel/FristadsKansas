<?php
    $telefonnummer = $_SESSION['kundeTelefonnummer'];
    $brugerid = $_SESSION['bruger']['bruger_id'];
    $kundeoplysninger = hentKundeoplysninger($telefonnummer, $brugerid);
        
        ?>
<p>Aktive abonnementer for <?php echo $kundeoplysninger[0]['kundenavn']?></p>
<table class="table table-striped">
    <thead>
        <tr>
            <th scope="col">Abonnement</th>
            <th scope="col">Antal</th>
            <th scope="col">Pris pr. måned</th>
        </tr>
        <form method="post">
            <?php foreach($kundeoplysninger as $kundeabonnement){?>
            <tr>
                <td><?php echo $kundeabonnement["abonnementtype"] ?></td>
                <td><input type="number" value="<?php echo $kundeabonnement["antal"] ?>"></td>
                <td><?php echo $kundeabonnement["styk_pris"] * $kundeabonnement["antal"] ?></td>
                <td><input type="submit" name="btnsubmit" value="Opdater abonnement"></td>
            </tr>
            <?php } ?>
        </form>
    </thead>
    
    <?php
    if(isset($_POST['btnsubmit'])){

    }