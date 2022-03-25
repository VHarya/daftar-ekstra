@include('partial.header')

<!-- Content Wrapper. Contains page content -->
<div id="page-content" class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header" style="background-color: white; margin-bottom: 0.5rem">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <h1 class="m-0">List Siswa</h1>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <table id="example1" class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>User ID</th>
                            <th>Kelas</th>
                            <th>Absen</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($siswa as $key=>$s)
                            <tr>
                                <td>{{ $key += 1 }}</td>
                                <td>{{ $s->id_user }}</td>
                                <td>{{ $s->kelas }}</td>
                                <td>{{ $s->absen }}</td>
                                <td>
                                    <a class="btn btn-warning" href="{{ url('/siswa/edit/'.$s->id) }}">
                                        <i class="nav-icon fas fa-pen"></i>
                                    </a>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

@include('partial.footer')
