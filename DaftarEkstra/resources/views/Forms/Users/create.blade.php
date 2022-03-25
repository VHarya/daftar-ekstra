@include('partial.header')

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header" style="background-color: white; margin-bottom: 1rem">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <h1 class="m-0">Create Users</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <a class="btn btn-danger" style="float: right" href="{{ url('/') }}">Kembali</a>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="d-flex justify-content-center row">
                <div class="col-sm-8">
                    <div class="card">
                        <form action="{{ url('/user/create') }}">
                            <div class="card-body">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="username">Username</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" name="username">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Password</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" name="password" type="password">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Nama</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" name="nama">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Role</label>
                                    <div class="form-check form-check-inline" style="margin-left: 10px">
                                        <input class="form-check-input" type="radio" name="roleOption" id="inlineRadio1" value="siswa" checked>
                                        <label class="form-check-label" for="inlineRadio1">Siswa</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="roleOption" id="inlineRadio2" value="pembimbing">
                                        <label class="form-check-label" for="inlineRadio2">Pembimbing</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="roleOption" id="inlineRadio3" value="admin">
                                        <label class="form-check-label" for="inlineRadio3">Admin</label>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="form-group row" style="float: right">
                                    <button type="submit" class="btn btn-primary" style="margin: 0rem 1rem">Submit</button>
                                    <a class="btn btn-danger" href="{{ url('/') }}">Cancel</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.card -->
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

@include('partial.footer')
