<nav class="navbar navbar-default">
        <div class="navbar-header">
            <form method="get">
                    <button type="submit" name="nav" value="nyKunde" class="btn btn-primary">Opret ny kunde</button>
                    <button type="submit" name="nav" value="nytAbonnement" class="btn btn-primary">Opret nyt abonnement</button>
                    <button type="submit" name="nav" value="tøjudlevering" class="btn btn-primary">Tøjudlevering</button>
                    <button type="submit" name="nav" value="tøjindlevering" class="btn btn-primary">Tøjindlevering</button>
                    <button type="submit" name="nav" value="kundeoplysninger" class="btn btn-primary">Rediger kundeoplysninger</button>
                    <button type="submit" name="nav" value="produktbestilling" class="btn btn-primary">produktbestilling</button>
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
}elseif(isset($_GET['nav'])){
    include_once("templates/" . $_GET['nav'] . ".php");
}else{
    echo "Du er logget ind som forhandler - " . $_SESSION['bruger']['butiksnavn'];
}