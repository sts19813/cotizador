<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Zone;
use App\Models\ZoneDevelopment;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class ZoneController extends Controller
{
    private const DEVELOPMENT_CATALOG = [
        33 => 'Piaró',
        43 => 'Paseo Península',
        32 => 'Hacienda Piaro',
        30 => 'Etapa 1',
        29 => 'Etapa 2',
        28 => 'Etapa 3',
        27 => 'Etapa 4',
        26 => 'Etapa 5',
        25 => 'Etapa 6',
        24 => 'Etapa 7',
        3 => 'Ahawell',
        2 => 'Portal',
        14 => 'Chakté',
        8 => 'Bayal',
        9 => 'Pakal',
        10 => 'Chechem',
    ];

    public function index()
    {
        $zones = Zone::with(['developments' => function ($query) {
            $query->orderBy('development_name');
        }])->orderBy('order')->orderBy('name')->get();

        return view('admin.zones.index', [
            'zones' => $zones,
            'developmentCatalog' => self::DEVELOPMENT_CATALOG,
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255|unique:zones,name',
            'image_url' => 'nullable|string|max:255',
            'order' => 'nullable|integer|min:0',
            'is_active' => 'nullable|boolean',
            'development_ids' => 'nullable|array',
            'development_ids.*' => 'integer|min:1',
        ]);

        $zone = Zone::create([
            'name' => $validated['name'],
            'slug' => $this->buildUniqueSlug($validated['name']),
            'image_url' => $validated['image_url'] ?? null,
            'order' => (int) ($validated['order'] ?? 0),
            'is_active' => $request->boolean('is_active', true),
        ]);

        $this->syncZoneDevelopments($zone, $validated['development_ids'] ?? []);

        return redirect()->route('admin.zones.index')->with('success', 'Zona creada correctamente.');
    }

    public function update(Request $request, Zone $zone)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255|unique:zones,name,' . $zone->id,
            'image_url' => 'nullable|string|max:255',
            'order' => 'nullable|integer|min:0',
            'is_active' => 'nullable|boolean',
            'development_ids' => 'nullable|array',
            'development_ids.*' => 'integer|min:1',
        ]);

        $zone->update([
            'name' => $validated['name'],
            'slug' => $this->buildUniqueSlug($validated['name'], $zone->id),
            'image_url' => $validated['image_url'] ?? null,
            'order' => (int) ($validated['order'] ?? 0),
            'is_active' => $request->boolean('is_active'),
        ]);

        $this->syncZoneDevelopments($zone, $validated['development_ids'] ?? []);

        return redirect()->route('admin.zones.index')->with('success', 'Zona actualizada correctamente.');
    }

    public function destroy(Zone $zone)
    {
        $zone->delete();

        return redirect()->route('admin.zones.index')->with('success', 'Zona eliminada correctamente.');
    }

    public function addDevelopment(Request $request, Zone $zone)
    {
        $validated = $request->validate([
            'development_id' => 'required|integer|min:1',
            'development_name' => 'nullable|string|max:255',
        ]);

        $developmentId = (int) $validated['development_id'];
        $developmentName = trim((string) ($validated['development_name'] ?? ''));

        if ($developmentName === '') {
            $developmentName = self::DEVELOPMENT_CATALOG[$developmentId] ?? "Desarrollo {$developmentId}";
        }

        ZoneDevelopment::updateOrCreate(
            [
                'zone_id' => $zone->id,
                'development_id' => $developmentId,
            ],
            [
                'development_name' => $developmentName,
            ]
        );

        return redirect()->route('admin.zones.index')->with('success', 'Desarrollo agregado a la zona.');
    }

    public function removeDevelopment(Zone $zone, ZoneDevelopment $development)
    {
        abort_unless((int) $development->zone_id === (int) $zone->id, 404);

        $development->delete();

        return redirect()->route('admin.zones.index')->with('success', 'Desarrollo eliminado de la zona.');
    }

    private function syncZoneDevelopments(Zone $zone, array $developmentIds): void
    {
        $normalizedIds = collect($developmentIds)
            ->map(fn($id) => (int) $id)
            ->filter(fn($id) => $id > 0)
            ->unique()
            ->values();

        if ($normalizedIds->isEmpty()) {
            $zone->developments()->delete();
            return;
        }

        $zone->developments()->whereNotIn('development_id', $normalizedIds)->delete();

        foreach ($normalizedIds as $developmentId) {
            ZoneDevelopment::updateOrCreate(
                [
                    'zone_id' => $zone->id,
                    'development_id' => $developmentId,
                ],
                [
                    'development_name' => self::DEVELOPMENT_CATALOG[$developmentId] ?? "Desarrollo {$developmentId}",
                ]
            );
        }
    }

    private function buildUniqueSlug(string $name, ?int $ignoreZoneId = null): string
    {
        $base = Str::slug($name);
        if ($base === '') {
            $base = 'zona';
        }

        $slug = $base;
        $suffix = 1;

        while (
            Zone::where('slug', $slug)
                ->when($ignoreZoneId, fn($query) => $query->where('id', '!=', $ignoreZoneId))
                ->exists()
        ) {
            $suffix++;
            $slug = "{$base}-{$suffix}";
        }

        return $slug;
    }
}
