<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

/// Controlador para actuar como proxy y evitar problemas de CORS al cargar SVGs desde dominios externos
 class SvgProxyController extends Controller
{
    public function show(Request $request)
    {
        $url = $request->query('url');

        if (!$url) {
            return response('URL parameter is required', 400);
        }

        try {
            $response = Http::get($url);

            if ($response->successful()) {
                return response($response->body(), 200)
                    ->header('Content-Type', 'image/svg+xml');
            } else {
                return response('Failed to fetch SVG', $response->status());
            }
        } catch (\Exception $e) {
            return response('Error fetching SVG: ' . $e->getMessage(), 500);
        }
    }
}
