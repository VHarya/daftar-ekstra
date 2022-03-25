<?php

namespace App\Http\Controllers;

use App\Models\Pembimbing;
use App\Models\User;

class PembimbingController extends Controller
{
    function index() {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        $data = Pembimbing::all();
        $data = json_decode($data);

        return view("pembimbing", ['pembimbing' => $data]);
    }

    function edit($id) {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        $user = User::all();

        $data = Pembimbing::find($id);
        $data = json_decode($data);

        return view("Forms/Pembimbing/edit", [
            'pembimbing' => $data,
            'user' => $user,
        ]);
    }

    function update($id) {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        Pembimbing::where('id', $id)->update([
            'id_user' => request()->get('id_user'),
            'telp' => request()->get('telp'),
            'alamat' => request()->get('alamat'),
        ]);

        return redirect('/pembimbing');
    }

    function loginCheck() {
        $isLoggedIn = session('logged_in');

        return $isLoggedIn;
    }
}
