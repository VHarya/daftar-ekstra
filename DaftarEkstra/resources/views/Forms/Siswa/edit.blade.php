@include('partial.header')

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header" style="background-color: white; margin-bottom: 1rem">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <h1 class="m-0">Edit Siswa</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <a class="btn btn-danger" style="float: right" href="{{ url('/siswa') }}">Kembali</a>
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
                        <form action="{{ url('/siswa/update/'.$siswa->id) }}">
                            <div class="card-body">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="username">ID User</label>
                                    <div class="col-sm-10">
                                        <select name="id_user" class="form-control form-select-lg">
                                            @foreach($user as $key=>$u)
                                                @if($key == 0)
                                                    <option value="{{ $u->id }}" selected>{{ $u->id }}</option>
                                                @else
                                                    <option value="{{ $u->id }}">{{ $u->id }}</option>
                                                @endif
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Kelas</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" name="kelas" value="{{ $siswa->kelas }}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Absen</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" name="absen" value="{{ $siswa->absen }}">
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="form-group row" style="float: right">
                                    <button type="submit" class="btn btn-primary" style="margin: 0rem 1rem">Submit</button>
                                    <a class="btn btn-danger" href="{{ url('/siswa') }}">Cancel</a>
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
