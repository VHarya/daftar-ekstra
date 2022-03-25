<?php

namespace App\Http\Controllers;

use App\Models\Ekstra;
use App\Models\Nilai;
use App\Models\Siswa;

class NilaiController extends Controller
{
    function index() {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        $data = Nilai::all();
        $data = json_decode($data);

        $ekstra = Ekstra::all();

        return view("nilai", [
            'nilai' => $data,
            'ekstra' => $ekstra,
        ]);
    }

    function create() {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        if (\request()->get('nilai') == null) {
            $siswa = Siswa::all();
            $ekstra = Ekstra::all();

            return view("Forms/Nilai/create", [
                'siswa' => $siswa,
                'ekstra' => $ekstra,
            ]);
        }

        Nilai::create([
            'id_siswa' => request()->get('id_siswa'),
            'id_ekstra' => request()->get('id_ekstra'),
            'nilai' => request()->get('nilai'),
        ]);

        return redirect('/nilai');
    }

    function edit($id) {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        $data = Nilai::find($id);
        $data = json_decode($data);

        $siswa = Siswa::all();
        $ekstra = Ekstra::all();

        return view("Forms/Nilai/edit", [
            'nilai' => $data,
            'siswa' => $siswa,
            'ekstra' => $ekstra,
        ]);
    }

    function update($id) {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        Nilai::where('id', $id)->update([
            'id_siswa' => request()->get('id_siswa'),
            'id_ekstra' => request()->get('id_ekstra'),
            'nilai' => request()->get('nilai'),
        ]);

        return redirect('/nilai');
    }

    function delete($id) {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        Nilai::where('id', $id)->delete();

        return redirect('/nilai');
    }

    function loginCheck() {
        $isLoggedIn = session('logged_in');

        return $isLoggedIn;
    }
}
