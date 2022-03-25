@include('partial.header')

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header" style="background-color: white; margin-bottom: 1rem">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <h1 class="m-0">Create Ekstrakurikuler</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <a class="btn btn-danger" style="float: right" href="{{ url('/ekstra') }}">Kembali</a>
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
                        <form action="{{ url('/ekstra/create') }}">
                            <div class="card-body">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Ekstrakurikuler</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" name="nama">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Deskripsi</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" name="deskripsi" rows="5"></textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">Kegiatan</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" name="kegiatan" rows="4"></textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">ID Pembimbing</label>
                                    <div class="col-sm-10">
                                        <select name="id_pembimbing" class="form-control form-select-lg">
                                            @foreach($pembimbing as $key=>$p)
                                                @if($key == 0)
                                                    <option value="{{ $p->id }}" selected>{{ $p->id }}</option>
                                                @else
                                                    <option value="{{ $p->id }}">{{ $p->id }}</option>
                                                @endif
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label" for="icon">Icon Ekstrakurikuler</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="icon" aria-describedby="iconHelp">
                                        <small id="iconHelp" class="form-text text-muted">
                                            Kode Icon bisa dilihat <a href="https://api.flutter.dev/flutter/material/Icons-class.html#constants">di sini<a>
                                        </small>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="form-group row" style="float: right">
                                    <button type="submit" class="btn btn-primary" style="margin: 0rem 1rem">Submit</button>
                                    <a class="btn btn-danger" href="{{ url('/ekstra') }}">Cancel</a>
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
