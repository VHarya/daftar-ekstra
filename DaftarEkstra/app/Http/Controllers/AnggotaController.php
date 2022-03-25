<?php

namespace App\Http\Controllers;

use App\Models\Anggota;
use App\Models\Ekstra;
use App\Models\Siswa;

class AnggotaController extends Controller
{
    function index() {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        $data = Anggota::all();
        $data = json_decode($data);

        $ekstra = Ekstra::all();

        return view("anggota", [
            'anggota' => $data,
            'ekstra' => $ekstra,
        ]);
    }

    function create() {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        if (\request()->get('id_siswa') == null) {
            $siswa = Siswa::all();
            $ekstra = Ekstra::all();

            return view("Forms/Anggota/create", [
                'siswa' => $siswa,
                'ekstra' => $ekstra,
            ]);
        }

        Anggota::create([
            'id_siswa' => request()->get('id_siswa'),
            'id_ekstra' => request()->get('id_ekstra'),
        ]);

        return redirect('/anggota');
    }

    function edit($id) {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        $data = Anggota::find($id);
        $data = json_decode($data);

        $siswa = Siswa::all();
        $ekstra = Ekstra::all();

        return view("Forms/Anggota/edit", [
            'anggota' => $data,
            'siswa' => $siswa,
            'ekstra' => $ekstra,
        ]);
    }

    function update($id) {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        Anggota::where('id', $id)->update([
            'id_siswa' => request()->get('id_siswa'),
            'id_ekstra' => request()->get('id_ekstra'),
        ]);

        return redirect('/anggota');
    }

    function delete($id) {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        Anggota::where('id', $id)->delete();

        return redirect('/anggota');
    }

    function loginCheck() {
        $isLoggedIn = session('logged_in');

        return $isLoggedIn;
    }
}
