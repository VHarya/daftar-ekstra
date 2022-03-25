@include('partial.header')

<!-- Content Wrapper. Contains page content -->
<div id="page-content" class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header" style="background-color: white; margin-bottom: 0.5rem">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <h1 class="m-0">List Nilai</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <a class="btn btn-primary" style="float: right" href="{{ url('/nilai/create') }}">Create</a>
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
                            <th>Siswa</th>
                            <th>Ekstra</th>
                            <th>Nilai</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($nilai as $key=>$n)
                            <tr>
                                <td>{{ $k = $key + 1 }}</td>
                                <td>{{ $n->id_siswa }}</td>

                                @if($ekstra[$key]->id == $n->id_ekstra)
                                <td>{{ $ekstra[$key]->nama }}</td>
                                @endif

                                <td>{{ $n->nilai }}</td>
                                <td>
                                    <a class="btn btn-warning" href="{{ url('/nilai/edit/'.$n->id) }}">
                                        <i class="nav-icon fas fa-pen"></i>
                                    </a>
                                    <a class="btn btn-danger" data-toggle="modal" data-target="#exampleModal" onclick="nilaiID = {{ $n->id }}">
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
                <button type="button" class="btn btn-primary" onclick="deleteNilai()">Iya, hapus data</button>
            </div>
        </div>
    </div>
</div>

@include('partial.footer')
