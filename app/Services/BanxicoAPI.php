<?php

namespace App\Services\BanxicoAPI;

class BanxicoAPI
{
    public function getDolarValue() {
        // dd("aca ando");
        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, "https://www.banxico.org.mx/SieAPIRest/service/v1/series/SF43718/datos?token=4b0e2214537bc1d13041d712903d3921de1e56fb74863d9d11bff009d9d6ac30");
        
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        // curl_setopt($ch, CURLOPT_POSTFIELDS, "");
        // curl_setopt($ch, CURLOPT_POST, 1);
        // curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

        $result = curl_exec($ch);
        //  dd($result);

        if (curl_errno($ch)) {
            echo 'Error:' . curl_error($ch);
        }

        return json_decode($result);
    }
}