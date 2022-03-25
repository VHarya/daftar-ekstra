@include('partial.header')

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header" style="background-color: white; margin-bottom: 1rem">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <h1 class="m-0">Edit Users</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <a class="btn btn-danger" style="float: right" href="{{ url('/nilai') }}">Kembali</a>
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
                        <form action="{{ url('/nilai/update/'.$nilai->id) }}">
                            <div class="card-body">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">ID Siswa</label>
                                    <div class="col-sm-10">
                                        <select name="id_siswa" class="form-control form-select-lg">
                                            @foreach($siswa as $key=>$s)
                                                @if($s->id == $nilai->id_siswa)
                                                    <option value="{{ $s->id }}" selected>{{ $s->id }}</option>
                                                @else
                                                    <option value="{{ $s->id }}">{{ $s->id }}</option>
                                                @endif
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">ID Ekstrakurikuler</label>
                                    <div class="col-sm-10">
                                        <select name="id_ekstra" class="form-control form-select-lg">
                                            @foreach($ekstra as $key=>$e)
                                                @if($e->id == $nilai->id_ekstra)
                                                    <option value="{{ $e->id }}" selected>{{ $e->id }}</option>
                                                @else
                                                    <option value="{{ $e->id }}">{{ $e->id }}</option>
                                                @endif
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Nilai</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" name="nilai" value="{{ $nilai->nilai }}" type="number">
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="form-group row" style="float: right">
                                    <button type="submit" class="btn btn-primary" style="margin: 0rem 1rem">Submit</button>
                                    <a class="btn btn-danger" href="{{ url('/nilai') }}">Cancel</a>
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
