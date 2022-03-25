@include('partial.header')

<!-- Content Wrapper. Contains page content -->
<div id="page-content" class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header" style="background-color: white; margin-bottom: 0.5rem">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <h1 class="m-0">List Ekstrakurikuler</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <a class="btn btn-primary" style="float: right" href="{{ url('/ekstra/create') }}">Create</a>
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
                            <th>Ekstrakurikuler</th>
                            <th>Deskripsi</th>
                            <th>ID Pembimbing</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($ekstra as $key=>$e)
                            <tr>
                                <td>{{ $key += 1 }}</td>
                                <td>{{ $e->nama }}</td>
                                <td>{{ $e->deskripsi }}</td>
                                <td>{{ $e->id_pembimbing }}</td>
                                <td>
                                    <a class="btn btn-warning" href="{{ url('/ekstra/edit/'.$e->id) }}">
                                        <i class="nav-icon fas fa-pen"></i>
                                    </a>
                                    <a class="btn btn-danger" data-toggle="modal" data-target="#exampleModal" onclick="ekstraID = {{ $e->id }}">
                                        <i class="nav-icon fas fa-trash"></i>
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

<div id="exampleModal" class="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Warning!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Apakah anda yakin ingin menghapus data ini?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Tidak, jangan hapus data</button>
                <button type="button" class="btn btn-primary" onclick="deleteEkstra()">Iya, hapus data</button>
            </div>
        </div>
    </div>
</div>

@include('partial.footer')
