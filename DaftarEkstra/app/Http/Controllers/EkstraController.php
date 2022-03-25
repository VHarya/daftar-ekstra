<?php

namespace App\Http\Controllers;

use App\Models\Ekstra;
use App\Models\Pembimbing;

class EkstraController extends Controller
{
    function index() {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        $data = Ekstra::all();
        $data = json_decode($data);

        return view("ekstra", ['ekstra' => $data]);
    }

    function create() {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        if (\request()->get('nama') == null) {
            $pembimbing = Pembimbing::all();

            return view("Forms/Ekstra/create", ['pembimbing' => $pembimbing]);
        }

        Ekstra::create([
            'nama' => request()->get('nama'),
            'deskripsi' => request()->get('deskripsi'),
            'kegiatan' => request()->get('kegiatan'),
            'id_pembimbing' => request()->get('id_pembimbing'),
            'icon' => hexdec(request()->get('icon')),
        ]);

        return redirect('/ekstra');
    }

    function edit($id) {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        $pembimbing = Pembimbing::all();

        $data = Ekstra::find($id);
        $data = json_decode($data);

        return view("Forms/Ekstra/edit", [
            'ekstra' => $data,
            'pembimbing' => $pembimbing,
        ]);
    }

    function update($id) {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        Ekstra::where('id', $id)->update([
            'nama' => request()->get('nama'),
            'deskripsi' => request()->input('deskripsi'),
            'kegiatan' => request()->input('kegiatan'),
            'id_pembimbing' => request()->get('id_pembimbing'),
            'icon' => hexdec(request()->get('icon')),
        ]);

        return redirect('/ekstra');
    }

    function delete($id) {
        if (!$this->loginCheck()) {
            return redirect('/');
        }

        Ekstra::where('id', $id)->delete();

        return redirect('/ekstra');
    }

    function loginCheck() {
        $isLoggedIn = session('logged_in');

        return $isLoggedIn;
    }
}
