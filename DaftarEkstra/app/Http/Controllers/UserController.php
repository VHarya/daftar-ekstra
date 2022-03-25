<?php

namespace App\Http\Controllers;

use App\Models\Pembimbing;
use App\Models\Siswa;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;

class UserController extends Controller
{
    function index() {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        $data = User::all();
        $data = json_decode($data);

        return view("users", ['users' => $data]);
    }

    function create() {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        if (request()->get('nama') == null) {
            return view("Forms/Users/create");
        }

        $role = request()->get('roleOption');

        $data = User::create([
            'username' => request()->get('username'),
            'password' => request()->input('password'),
            'nama' => request()->get('nama'),
            'role' => $role,
        ]);

        if ($role == 'siswa') {
            Siswa::create([
                'id_user' => $data->id,
                'kelas' => '',
                'absen' => '',
            ]);
        }
        else if ($role == 'pembimbing') {
            Pembimbing::create([
                'id_user' => $data->id,
                'telp' => '',
                'alamat' => '',
            ]);
        }

        return redirect('/user');
    }

    function edit($id) {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        $data = User::find($id);
        $data = json_decode($data);

        return view("Forms/Users/edit", ['user' => $data]);
    }

    function update($id) {
        $data = User::where('id', $id)->update([
            'username' => request()->get('username'),
            'password' => request()->get('password'),
            'nama' => request()->get('nama'),
            'role' => request()->get('roleOption'),
        ]);

        return redirect('/user');
    }

    function delete($id) {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        $user = User::where('id', $id)->first();

        if ($user->role == 'siswa') {
            Siswa::where('id_user', $id)->delete();
        }
        else if ($user->role == 'pembimbing') {
            Pembimbing::where('id_user', $id)->delete();
        }

        User::where('id', $id)->delete();

        return redirect('/user');
    }

    function login() {
        if (!$this->loginCheck() && request()->input('password') == null) {
            return view("login");
        }
        else if ($this->loginCheck()) {
            return redirect('/user');
        }

        $username = request()->get('username');
        $password = request()->input('password');

        $user = User::where('username', $username)->where('password', $password)->first();

        if ($user != null && $user->role == 'admin') {
            session(['logged_in' => true, 'name' => $user->nama]);

            return redirect('/user');
        }
        else {
            return redirect('/');
        }
    }

    function logout() {
        session()->flush();
        return redirect('/');
    }

    function loginCheck() {
        $isLoggedIn = session('logged_in');

        return $isLoggedIn;
    }
}
