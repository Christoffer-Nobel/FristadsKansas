<nav class="navbar navbar-default">
        <div class="navbar-header">
            <form method="post">
                    <button type="submit" name="nav" value=".php" class="btn btn-primary">Opslagstavle</button>
                    <button type="submit" name="nav" value="employees.php" class="btn btn-primary">Medarbejdere</button>
                    <button type="submit" name="nav" value="calender.php" class="btn btn-primary">Kalender</button>
                    <button type="submit" name="nav" value="orders.php" class="btn btn-primary">Bestillingsoversigt</button>
                    <button type="submit" name="nav" value="customers.php" class="btn btn-primary">Kundeideer</button>
            </form> 
        </div>
        <div class="navbar-right">
            <form method="post">
                <button type="submit" name="logout" class="btn btn-primary">log ud</button>
            </form>
        </div>
</nav>

<?php 

if(isset($_POST['logout'])){
    session_destroy();
    header('location: index.php');
}
if(isset($_POST['nav'])){
    include_once("templates/" . $_POST['nav']);
}else{
    echo "Du er logget ind som Fristads Kansas" . $_SESSION['employee']['fornavn'] . " " . $_SESSION['employee']['efternavn'];
}