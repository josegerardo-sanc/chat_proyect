<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="librerias/css/bootstrap.css">
    <script src="librerias/js/all.js"></script>
</head>

<body>
    <?php
session_start();    
    if(isset($_SESSION['error'])){
?>
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Error</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <?php echo $_SESSION['error'];?>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <?php
    }
    unset($_SESSION['error']);
   ?>

    <div class="container" style="margin-top: 100px;">

        <div class="row d-flex justify-content-center">

            <div class="col-sm-12 col-md-5">
                <form action="php/acceso.php" class="bg-light border p-3" method="POST">
                    <h4 class="lead p-2 text-muted text-center"><b>Acceder</b></h4>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1"><i class="fas fa-user"></i></span>
                        </div>
                        <input name="usuario" type="text" class="form-control" placeholder="Usuario" aria-label="Username" aria-describedby="basic-addon1" required>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1"><i class="fas fa-key"></i></span>
                        </div>
                        <input name="pass" type="password" class="form-control" placeholder="Password" aria-label="password" aria-describedby="basic-addon1" required>
                    </div>

                    <div>
                        <!-- 
                        <button type="submit" value="regitrar" name="btn_action" class="btn  btn-info" style="border-radius: 0px;">Registrarse</button> -->
                        <button type="submit" value="acceso" name="acceso" class="btn btn-primary" style="border-radius: 0px;">Entrar</button>
                    </div>
                </form>


            </div>
        </div>
    </div>

    <script src="librerias/js/jquery-3.3.1.js"></script>
    <script src="librerias/js/bootstrap.js"></script>
    <script>
        $(function() {
            $('#exampleModal').modal('show');
        });

    </script>
</body>

</html>
