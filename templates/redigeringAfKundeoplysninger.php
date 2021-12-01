<?php
    $telefonnummer = $_SESSION['kundeTelefonnummer'];
    $brugerid = $_SESSION['bruger']['bruger_id'];
    $kundeoplysninger = hentKundeoplysninger($telefonnummer, $brugerid);
    $nyKunde = hentNyKunde($telefonnummer, $brugerid);
    $resultat = null;   
        ?>
<p>Aktive abonnementer for <?php echo $nyKunde[0]['kundenavn']?></p>
<table class="table table-striped">
    <thead>
        <tr>
            <th scope="col">Abonnement ID</th>    
            <th scope="col">Abonnement</th>
            <th scope="col">Antal</th>
            <th scope="col">Pris pr. måned</th>
            <th scope="col"></th>
        </tr>
        <?php for( $i = 0; $i < count($kundeoplysninger); $i++){?>
            <tr>
                <form method="post"?>
                    <td><?php echo $kundeoplysninger[$i]["kunde_abonnement_id"] ?></td>
                    <td><?php echo $kundeoplysninger[$i]["abonnementtype"] ?></td>
                    <td><input type="number" name="antal" value="<?php echo $kundeoplysninger[$i]["antal"] ?>"></td>
                    <td><?php $pris = $kundeoplysninger[$i]["styk_pris"] * $kundeoplysninger[$i]["antal"]; echo $pris?></td>
                    <td><button type="submit" name="btnsubmit" value="<?php echo $kundeoplysninger[$i]['kunde_abonnement_id']?>">Rediger abonnement</button><br>
                    <button type="submit" name="btnslet" value="<?php echo $kundeoplysninger[$i]['kunde_abonnement_id']?>">Slet abonnement</button>
                </form> 
            </tr><?php
            $resultat = $resultat + $pris;
            } ?>
            <tr>
                <th scope="col">I ALT</th>    
                <th scope="col"></th>
                <th scope="col"></th>
                <th scope="col"><? echo $resultat ?></th>
                <th scope="col"></th>
            </tr>
    </thead>
    
    <?php
    if(isset($_POST['btnsubmit'])){
        $sql = "UPDATE kunde_abonnementer SET antal = '" . $_POST['antal'] ."' WHERE kunde_abonnement_id = '" . $_POST['btnsubmit'] ."'";
        $result = mysqli_query($conn, $sql);
        header('refresh:0');
    }elseif(isset($_POST['btnslet'])){
        $sql = "DELETE FROM kunde_abonnementer WHERE kunde_abonnement_id = '" . $_POST['btnslet'] ."'";
        $result = mysqli_query($conn, $sql);
        header('refresh:0');
    }
