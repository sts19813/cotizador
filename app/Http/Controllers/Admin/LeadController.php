<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class LeadController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user = Auth::user();

        if (!$user || !$user->isAdmin()) {
            abort(403, 'No tienes permisos para acceder a esta página.');
        }

        $leads = User::latest()->get();

        return view('admin.leads.index', compact('leads'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name'  => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
        ]);

        User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt('password'), // Puedes dejarlo en blanco o generar uno aleatorio
        ]);

        return redirect()->route('admin.leads.index')->with('success', 'Lead creado correctamente.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, User $lead)
    {
        $request->validate([
            'name'  => 'required|string|max:255',
            'email' => 'required|email|unique:users,email,' . $lead->id,
        ]);

        $lead->update($request->only(['name', 'email']));

        return redirect()->route('admin.leads.index')->with('success', 'Lead actualizado correctamente.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(User $lead)
    {
        $lead->delete();

        return redirect()->route('admin.leads.index')->with('success', 'Lead eliminado correctamente.');
    }
}
