<?php include_once('../_header.php'); ?>

    <div class="box">
        <h1>Dokter</h1>
        <h4>
            <small>Data Dokter</small>
            <div class="pull-right">
                <!-- button refresh -->
                <a href="" class="btn btn-default btn-xs"><i class="glyphicon glyphicon-refresh"></i></a>
                <!-- button tambah data -->
                <a href="add.php" class="btn btn-success btn-xs"><i class="glyphicon glyphicon-plus"></i>Tambah Dokter</a>
            </div>
        </h4>
        <!-- tampilan tabel -->
        <form method="post" name="proses">
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover" id="dokter">
                <thead>
                    <tr>
                        <th>
                            <center>
                                <input type="checkbox" name="select_all" id="select_all" value="">
                            </center>
                        </th>
                        <th>No.</th>
                        <th>Nama Dokter</th>
                        <th>Spesialis</th>
                        <th>Alamat</th>
                        <th>no_telp</th>
                        <th><i class="glyphicon glyphicon-cog"></i></th>
                        
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $no = 1;
                    $sql_dokter = mysqli_query($con, "SELECT * FROM tb_dokter") or die (mysqli_error($con));
                    while($data= mysqli_fetch_array($sql_dokter)) { ?>
                        <tr>
                            <td align="center">
                                <input type="checkbox" name="checked[]" class="check" value="<?=$data['id_dokter']?>">
                            </td>
                            <td><?=$no++?>.</td>
                            <td><?=$data['nama_dokter']?></td>
                            <td><?=$data['spesialis']?></td>
                            <td><?=$data['alamat']?></td>
                            <td><?=$data['no_telp']?></td>
                            <td align="center">
                                <a href="edit.php?id=<?=$data['id_dokter']?>" class="btn btn-warning btn-xs"><i class="glyphicon glyphicon-edit"></i></a>
                            </td>
                            
                        </tr>
                    <?php
                    }
                ?>
            </tbody>
            </table>
        </div>
        </form>

        <div class="box pull-right">
            <button class="btn btn-danger btn-sm" onclick="hapus()"><i class="glyphicon glyphicon-trash"></i> Hapus</button>
        </div>
    </div>
    <script>    
        $(document).ready( function () {
        $('#outlet').DataTable();
    } );
    </script>


<?php include_once('../_footer.php'); ?>