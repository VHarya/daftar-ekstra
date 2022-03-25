<?php

namespace App\Http\Controllers;

use App\Models\Anggota;
use App\Models\Ekstra;
use App\Models\Nilai;
use App\Models\Pembimbing;
use App\Models\Siswa;
use App\Models\User;
use Illuminate\Http\Request;

class APIController extends Controller
{
    function login($username, $password) {
        $user = User::where('username', $username)->where('password', $password)->first();
        $siswa = Siswa::where('id_user', $user->id)->first();

        $data = [
            'id_user' => $user->id,
            'id_siswa' => $siswa->id,
        ];

        return response($data);
    }

    function getSiswaData($userID) {
        $user = User::where('id', $userID)->first();
        $userData = Siswa::where('id_user', $userID)->first();

        if ($userData == null) {
            return response([
                'error' => "User isn't a student",
            ]);
        }

        $anggota = Anggota::where('id_siswa', $userData->id)->get();
        foreach ($anggota as $a) {
            $rawEkstra[] = Ekstra::where('id', $a->id_ekstra)->first();
        }

        foreach ($rawEkstra as $e) {
            $pembimbing = Pembimbing::where('id', $e->id_pembimbing)->first();
            $u = User::where('id', $pembimbing->id_user)->first();

            $ekstra[] = [
                'nama' => $e->nama,
                'pembimbing' => $u->nama,
            ];
        }

        $data = [
            'nama' => $user->nama,
            'kelas' => $userData->kelas,
            'absen' => $userData->absen,
            'ekstra' => $ekstra,
        ];

        return response($data);
    }

    function getNilaiSiswa($userID) {
        $siswa = Siswa::where('id_user', $userID)->first();
        $nilai = Nilai::where('id_siswa', $siswa->id)->get();

        foreach ($nilai as $n) {
            $ekstra = Ekstra::where('id', $n->id_ekstra)->get();
        }
        foreach ($ekstra as $e) {
            $pembimbing = Pembimbing::where('id', $e->id_pembimbing)->first();
        }

        $user = User::where('id', $pembimbing->id_user)->first();

        for ($i = 0; $i < count($ekstra); $i++) {
            $data[] = [
                'ekstra' => $ekstra[$i]->nama,
                'nilai' => $nilai[$i]->nilai,
                'pembimbing' => $user->nama,
            ];
        }

        return response(['nilai' => $data]);
    }

    function getAllEkstra() {
        $ekstra = Ekstra::all();

        foreach ($ekstra as $e) {
            $pembimbingUID = Pembimbing::where('id', $e->id_pembimbing)->first();
            $pembimbing = User::where('id', $pembimbingUID->id_user)->first();
            $anggota = Anggota::where('id_ekstra', $e->id)->get();
            $jumlahAnggota = count($anggota);
    
            $data[] = [
                'id' => $e->id,
                'nama' => $e->nama,
                'deskripsi' => $e->deskripsi,
                'kegiatan' => $e->kegiatan,
                'pembimbing' => $pembimbing->nama,
                'anggota' => $jumlahAnggota,
                'icon' => $e->icon,
            ];
        }

        return response(['ekstra' => $data]);
    }

    function getEkstra($id) {
        $ekstra = Ekstra::find($id);

        return response([
            'data' => $ekstra,
        ]);
    }

    function daftarEkstra(Request $request) {
        $userID = $request->get('id_siswa');
        $ekstraID = $request->get('id_ekstra');

        $checker = Anggota::where('id_siswa', $userID)->where('id_ekstra', $ekstraID)->first();
        $ekstraSiswa = Anggota::where('id_siswa', $userID)->get();
        $limiter = count($ekstraSiswa);

        if ($checker == null) {
            if ($limiter < 2) {
                $createdItem = Anggota::create([
                    'id_siswa' => $userID,
                    'id_ekstra' => $ekstraID
                ]);

                return response(true, 201);
            }
        }
        return response(false, 400);
    }
}
