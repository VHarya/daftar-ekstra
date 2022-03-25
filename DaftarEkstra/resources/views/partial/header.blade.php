<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>StudentActivities | Admin</title>

    <!-- Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="{{ URL::to('/') }}/AdminLTE-3.1.0/plugins/fontawesome-free/css/all.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{ URL::to('/') }}/AdminLTE-3.1.0/dist/css/adminlte.min.css">

    <link rel="stylesheet" href="{{ URL::to('/') }}/main.css">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->
        <a href="/" class="brand-link">
            <img src="{{ URL::to('/') }}/img/logo-grafika.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
            <span class="brand-text font-weight-light">StudentActivities</span>
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img src="{{ URL::to('/') }}/img/ti-default.jpg" class="img-circle elevation-2" alt="User Image">
                </div>
                <div class="info">
                    <a class="d-block">{{ ucwords(session('name')) }}</a>
                </div>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                    <li class="nav-item">
                        @if (\Illuminate\Support\Facades\Route::current()->uri() == "user")
                        <a href="{{ url('/user') }}" class="nav-link active">
                            <i class="nav-icon fas fa-user"></i>
                            <p>Users</p>
                        </a>
                        @else
                        <a href="{{ url('/user') }}" class="nav-link">
                            <i class="nav-icon fas fa-user"></i>
                            <p>Users</p>
                        </a>
                        @endif
                    </li>
                    <li class="nav-item">
                        @if (\Illuminate\Support\Facades\Route::current()->uri() == "siswa")
                        <a href="{{ url('/siswa') }}" class="nav-link active">
                            <i class="nav-icon fas fa-graduation-cap"></i>
                            <p>Siswa</p>
                        </a>
                        @else
                        <a href="{{ url('/siswa') }}" class="nav-link">
                            <i class="nav-icon fas fa-graduation-cap"></i>
                            <p>Siswa</p>
                        </a>
                        @endif
                    </li>
                    <li class="nav-item">
                        @if (\Illuminate\Support\Facades\Route::current()->uri() == "pembimbing")
                            <a href="{{ url('/pembimbing') }}" class="nav-link active">
                                <i class="nav-icon fas fa-chalkboard-teacher"></i>
                                <p>Pembimbing</p>
                            </a>
                        @else
                            <a href="{{ url('/pembimbing') }}" class="nav-link">
                                <i class="nav-icon fas fa-chalkboard-teacher"></i>
                                <p>Pembimbing</p>
                            </a>
                        @endif
                    </li>
                    <li class="nav-item">
                        @if (\Illuminate\Support\Facades\Route::current()->uri() == "nilai")
                            <a href="{{ url('/nilai') }}" class="nav-link active">
                                <i class="nav-icon fas fa-star"></i>
                                <p>Nilai</p>
                            </a>
                        @else
                            <a href="{{ url('/nilai') }}" class="nav-link">
                                <i class="nav-icon fas fa-star"></i>
                                <p>Nilai</p>
                            </a>
                        @endif
                    </li>
                    <li class="nav-item">
                        @if (\Illuminate\Support\Facades\Route::current()->uri() == "ekstra")
                            <a href="{{ url('/ekstra') }}" class="nav-link active">
                                <i class="nav-icon fas fa-paint-brush"></i>
                                <p>Ekstrakurikuler</p>
                            </a>
                        @else
                            <a href="{{ url('/ekstra') }}" class="nav-link">
                                <i class="nav-icon fas fa-paint-brush"></i>
                                <p>Ekstrakurikuler</p>
                            </a>
                        @endif
                    </li>
                    <li class="nav-item">
                        @if (\Illuminate\Support\Facades\Route::current()->uri() == "anggota")
                            <a href="{{ url('/anggota') }}" class="nav-link active">
                                <i class="nav-icon fas fa-list"></i>
                                <p>Anggota Ekstra</p>
                            </a>
                        @else
                            <a href="{{ url('/anggota') }}" class="nav-link">
                                <i class="nav-icon fas fa-list"></i>
                                <p>Anggota Ekstra</p>
                            </a>
                        @endif
                    </li>
                    <li class="nav-item">
                        <a href="{{ url('/logout') }}" class="nav-link">
                            <i class="nav-icon fas fa-door-open"></i>
                            <p>Logout</p>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>
