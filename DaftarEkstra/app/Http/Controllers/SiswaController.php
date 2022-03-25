<?php

namespace App\Http\Controllers;

use App\Models\Siswa;
use App\Models\User;

class SiswaController extends Controller
{
    function index() {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        $data = Siswa::all();
        $data = json_decode($data);

        return view("siswa", ['siswa' => $data]);
    }

    function edit($id) {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        $user = User::all();

        $data = Siswa::find($id);
        $data = json_decode($data);

        return view("Forms/Siswa/edit", [
            'siswa' => $data,
            'user' => $user,
        ]);
    }

    function update($id) {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        Siswa::where('id', $id)->update([
            'id_user' => request()->get('id_user'),
            'kelas' => request()->get('kelas'),
            'absen' => request()->get('absen'),
        ]);

        return redirect('/siswa');
    }

    function loginCheck() {
        $isLoggedIn = session('logged_in');

        return $isLoggedIn;
    }
}
