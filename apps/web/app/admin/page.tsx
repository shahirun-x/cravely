"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";

interface Neighborhood {
  id: string;
  name: string;
}

interface Restaurant {
  id: string;
  name: string;
  neighborhood_id: string | null;
  neighborhood?: string;
  cuisines?: string[];
  price_range: number | null;
  is_pure_veg: boolean | null;
  avg_rating: number | null;
}

interface RestaurantForm {
  name: string;
  description: string;
  neighborhood_id: string;
  address: string;
  phone: string;
  website: string;
  price_range: string;
  is_pure_veg: string;
  rating: string;
  latitude: string;
  longitude: string;
  google_place_id: string;
}

const EMPTY_FORM: RestaurantForm = {
  name: "",
  description: "",
  neighborhood_id: "",
  address: "",
  phone: "",
  website: "",
  price_range: "2",
  is_pure_veg: "false",
  rating: "",
  latitude: "",
  longitude: "",
  google_place_id: "",
};

const inputCls =
  "w-full bg-[#1A1A1A] border border-[#2A2A2A] rounded-lg px-3 py-2 text-[#F5F5F5] focus:border-[#FF6B35] outline-none text-sm";
const labelCls = "block text-xs text-[#888888] mb-1";

export default function AdminPage() {
  const router = useRouter();
  const supabase = createClient();

  const [checking, setChecking] = useState(true);
  const [tab, setTab] = useState<"restaurants" | "add">("restaurants");
  const [restaurants, setRestaurants] = useState<Restaurant[]>([]);
  const [neighborhoods, setNeighborhoods] = useState<Neighborhood[]>([]);
  const [loading, setLoading] = useState(false);
  const [toast, setToast] = useState<{ msg: string; ok: boolean } | null>(null);
  const [deleteId, setDeleteId] = useState<string | null>(null);
  const [editRestaurant, setEditRestaurant] = useState<Restaurant | null>(null);
  const [editForm, setEditForm] = useState<RestaurantForm>(EMPTY_FORM);
  const [form, setForm] = useState<RestaurantForm>(EMPTY_FORM);

  useEffect(() => {
    async function checkAuth() {
      const { data } = await supabase.auth.getUser();
      const email = data.user?.email ?? "";
      const adminEmail = process.env.NEXT_PUBLIC_ADMIN_EMAIL ?? "";
      if (!adminEmail || email !== adminEmail) {
        router.replace("/chat");
        return;
      }
      setChecking(false);
      fetchData();
    }
    checkAuth();
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  async function fetchData() {
    const [{ data: rests }, { data: hoods }] = await Promise.all([
      supabase
        .from("restaurants")
        .select("id, name, neighborhood_id, price_range, is_pure_veg, avg_rating")
        .order("name"),
      supabase.from("neighborhoods").select("id, name").order("name"),
    ]);
    setRestaurants(rests ?? []);
    setNeighborhoods(hoods ?? []);
  }

  function showToast(msg: string, ok = true) {
    setToast({ msg, ok });
    setTimeout(() => setToast(null), 3000);
  }

  async function handleAdd(e: React.FormEvent) {
    e.preventDefault();
    setLoading(true);
    const payload = {
      name: form.name,
      description: form.description || null,
      neighborhood_id: form.neighborhood_id || null,
      address: form.address || null,
      phone: form.phone || null,
      website: form.website || null,
      price_range: form.price_range ? Number(form.price_range) : null,
      is_pure_veg: form.is_pure_veg === "true",
      avg_rating: form.rating ? Number(form.rating) : null,
      latitude: form.latitude ? Number(form.latitude) : null,
      longitude: form.longitude ? Number(form.longitude) : null,
      google_place_id: form.google_place_id || null,
    };
    const { error } = await supabase.from("restaurants").insert(payload);
    setLoading(false);
    if (error) {
      showToast(error.message, false);
    } else {
      showToast("Restaurant added!");
      setForm(EMPTY_FORM);
      fetchData();
      setTab("restaurants");
    }
  }

  async function handleDelete(id: string) {
    const { error } = await supabase.from("restaurants").delete().eq("id", id);
    if (error) {
      showToast(error.message, false);
    } else {
      showToast("Deleted.");
      setRestaurants((prev) => prev.filter((r) => r.id !== id));
    }
    setDeleteId(null);
  }

  function openEdit(r: Restaurant) {
    setEditRestaurant(r);
    setEditForm({
      name: r.name,
      description: "",
      neighborhood_id: r.neighborhood_id ?? "",
      address: "",
      phone: "",
      website: "",
      price_range: String(r.price_range ?? 2),
      is_pure_veg: String(r.is_pure_veg ?? false),
      rating: String(r.avg_rating ?? ""),
      latitude: "",
      longitude: "",
      google_place_id: "",
    });
  }

  async function handleEditSave(e: React.FormEvent) {
    e.preventDefault();
    if (!editRestaurant) return;
    setLoading(true);
    const payload = {
      name: editForm.name,
      description: editForm.description || null,
      neighborhood_id: editForm.neighborhood_id || null,
      address: editForm.address || null,
      phone: editForm.phone || null,
      website: editForm.website || null,
      price_range: editForm.price_range ? Number(editForm.price_range) : null,
      is_pure_veg: editForm.is_pure_veg === "true",
      avg_rating: editForm.rating ? Number(editForm.rating) : null,
      latitude: editForm.latitude ? Number(editForm.latitude) : null,
      longitude: editForm.longitude ? Number(editForm.longitude) : null,
      google_place_id: editForm.google_place_id || null,
    };
    const { error } = await supabase
      .from("restaurants")
      .update(payload)
      .eq("id", editRestaurant.id);
    setLoading(false);
    if (error) {
      showToast(error.message, false);
    } else {
      showToast("Saved!");
      setEditRestaurant(null);
      fetchData();
    }
  }

  if (checking) {
    return (
      <div className="flex h-screen items-center justify-center bg-[#111111]">
        <span className="text-[#888888] text-sm">Checking access…</span>
      </div>
    );
  }

  const priceLabel = (p: number | null) =>
    p === 1 ? "₹" : p === 2 ? "₹₹" : p === 3 ? "₹₹₹" : "—";

  function FormFields({
    f,
    setF,
  }: {
    f: RestaurantForm;
    setF: (v: RestaurantForm) => void;
  }) {
    function set(k: keyof RestaurantForm) {
      return (
        e: React.ChangeEvent<
          HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement
        >
      ) => setF({ ...f, [k]: e.target.value });
    }
    return (
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <div className="sm:col-span-2">
          <label className={labelCls}>Name *</label>
          <input required className={inputCls} value={f.name} onChange={set("name")} />
        </div>
        <div className="sm:col-span-2">
          <label className={labelCls}>Description</label>
          <textarea className={inputCls} rows={3} value={f.description} onChange={set("description")} />
        </div>
        <div>
          <label className={labelCls}>Neighborhood</label>
          <select className={inputCls} value={f.neighborhood_id} onChange={set("neighborhood_id")}>
            <option value="">— select —</option>
            {neighborhoods.map((n) => (
              <option key={n.id} value={n.id}>{n.name}</option>
            ))}
          </select>
        </div>
        <div>
          <label className={labelCls}>Address</label>
          <input className={inputCls} value={f.address} onChange={set("address")} />
        </div>
        <div>
          <label className={labelCls}>Phone</label>
          <input className={inputCls} value={f.phone} onChange={set("phone")} />
        </div>
        <div>
          <label className={labelCls}>Website</label>
          <input className={inputCls} value={f.website} onChange={set("website")} />
        </div>
        <div>
          <label className={labelCls}>Price Range</label>
          <select className={inputCls} value={f.price_range} onChange={set("price_range")}>
            <option value="1">₹ Budget</option>
            <option value="2">₹₹ Mid-range</option>
            <option value="3">₹₹₹ Premium</option>
          </select>
        </div>
        <div>
          <label className={labelCls}>Veg / Non-Veg</label>
          <select className={inputCls} value={f.is_pure_veg} onChange={set("is_pure_veg")}>
            <option value="true">Pure Veg</option>
            <option value="false">Non-Veg</option>
          </select>
        </div>
        <div>
          <label className={labelCls}>Rating (0–5)</label>
          <input type="number" min={0} max={5} step={0.1} className={inputCls} value={f.rating} onChange={set("rating")} />
        </div>
        <div>
          <label className={labelCls}>Latitude</label>
          <input type="number" step="any" className={inputCls} value={f.latitude} onChange={set("latitude")} />
        </div>
        <div>
          <label className={labelCls}>Longitude</label>
          <input type="number" step="any" className={inputCls} value={f.longitude} onChange={set("longitude")} />
        </div>
        <div className="sm:col-span-2">
          <label className={labelCls}>Google Place ID</label>
          <input className={inputCls} value={f.google_place_id} onChange={set("google_place_id")} />
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-[#111111] text-[#F5F5F5]">
      {/* Toast */}
      {toast && (
        <div
          className="fixed top-4 right-4 z-50 px-4 py-2 rounded-lg text-sm font-medium shadow-lg"
          style={{
            backgroundColor: toast.ok ? "rgba(74,222,128,0.15)" : "rgba(239,68,68,0.15)",
            border: `1px solid ${toast.ok ? "rgba(74,222,128,0.3)" : "rgba(239,68,68,0.3)"}`,
            color: toast.ok ? "#4ade80" : "#f87171",
          }}
        >
          {toast.msg}
        </div>
      )}

      {/* Delete confirm dialog */}
      {deleteId && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/60">
          <div className="bg-[#1A1A1A] border border-[#2A2A2A] rounded-xl p-6 w-80 space-y-4">
            <p className="text-sm text-[#F5F5F5]">Delete this restaurant? This cannot be undone.</p>
            <div className="flex gap-3">
              <button
                onClick={() => handleDelete(deleteId)}
                className="flex-1 py-2 text-sm rounded-lg bg-red-500/10 text-[#F87171] border border-red-500/20 hover:bg-red-500/20 transition-colors"
              >
                Delete
              </button>
              <button
                onClick={() => setDeleteId(null)}
                className="flex-1 py-2 text-sm rounded-lg bg-[#FF6B35] text-white hover:bg-[#e05a28] transition-colors"
              >
                Cancel
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Edit dialog */}
      {editRestaurant && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/60 p-4">
          <div className="bg-[#1A1A1A] border border-[#2A2A2A] rounded-xl p-6 w-full max-w-2xl max-h-[90vh] overflow-y-auto space-y-4">
            <h2 className="text-base font-semibold text-[#F5F5F5]">Edit: {editRestaurant.name}</h2>
            <form onSubmit={handleEditSave} className="space-y-4">
              <FormFields f={editForm} setF={setEditForm} />
              <div className="flex gap-3 pt-2">
                <button
                  type="submit"
                  disabled={loading}
                  className="flex-1 py-2 text-sm rounded-lg bg-[#FF6B35] text-white hover:bg-[#e05a28] transition-colors disabled:opacity-50"
                >
                  {loading ? "Saving…" : "Save"}
                </button>
                <button
                  type="button"
                  onClick={() => setEditRestaurant(null)}
                  className="flex-1 py-2 text-sm rounded-lg border border-[#2A2A2A] text-[#888888] hover:border-[#FF6B35] transition-colors"
                >
                  Cancel
                </button>
              </div>
            </form>
          </div>
        </div>
      )}

      {/* Header */}
      <div className="border-b border-[#2A2A2A] px-6 py-4 flex items-center gap-3">
        <span className="text-[#FF6B35] font-bold text-lg">Cravely</span>
        <span className="text-[#2A2A2A]">|</span>
        <span className="text-sm text-[#888888]">Admin</span>
      </div>

      <div className="max-w-5xl mx-auto px-4 py-6 space-y-6">
        {/* Tabs */}
        <div className="flex gap-1 border-b border-[#2A2A2A]">
          {(["restaurants", "add"] as const).map((t) => (
            <button
              key={t}
              onClick={() => setTab(t)}
              className="px-4 py-2 text-sm font-medium transition-colors"
              style={{
                color: tab === t ? "#FF6B35" : "#888888",
                borderBottom: tab === t ? "2px solid #FF6B35" : "2px solid transparent",
              }}
            >
              {t === "restaurants" ? "Restaurants" : "Add New"}
            </button>
          ))}
        </div>

        {/* Restaurants tab */}
        {tab === "restaurants" && (
          <div className="space-y-4">
            <p className="text-xs text-[#888888]">{restaurants.length} restaurants</p>
            <div className="overflow-x-auto rounded-xl border border-[#2A2A2A]">
              <table className="w-full text-sm">
                <thead>
                  <tr className="border-b border-[#2A2A2A] text-[#888888] text-xs">
                    <th className="text-left px-4 py-3 font-medium">Name</th>
                    <th className="text-left px-4 py-3 font-medium">Cuisine</th>
                    <th className="text-left px-4 py-3 font-medium">Price</th>
                    <th className="text-left px-4 py-3 font-medium">Veg</th>
                    <th className="text-left px-4 py-3 font-medium">Rating</th>
                    <th className="px-4 py-3" />
                  </tr>
                </thead>
                <tbody>
                  {restaurants.map((r, i) => (
                    <tr
                      key={r.id}
                      className="border-b border-[#2A2A2A] last:border-0"
                      style={{ backgroundColor: i % 2 === 0 ? "transparent" : "rgba(255,255,255,0.02)" }}
                    >
                      <td className="px-4 py-3 text-[#F5F5F5] font-medium">{r.name}</td>
                      <td className="px-4 py-3 text-[#888888]">
                        {r.cuisines?.join(", ") ?? "—"}
                      </td>
                      <td className="px-4 py-3 text-[#888888]">{priceLabel(r.price_range)}</td>
                      <td className="px-4 py-3">
                        <span
                          className="w-2 h-2 rounded-full inline-block"
                          style={{ backgroundColor: r.is_pure_veg ? "#4ade80" : "#f87171" }}
                        />
                      </td>
                      <td className="px-4 py-3 text-[#888888]">{r.avg_rating ?? "—"}</td>
                      <td className="px-4 py-3">
                        <div className="flex items-center gap-2 justify-end">
                          <button
                            onClick={() => openEdit(r)}
                            className="px-3 py-1 text-xs rounded-md border border-[#2A2A2A] text-[#888888] hover:border-[#FF6B35] hover:text-[#FF6B35] transition-colors"
                          >
                            Edit
                          </button>
                          <button
                            onClick={() => setDeleteId(r.id)}
                            className="px-3 py-1 text-xs rounded-md bg-red-500/10 text-[#F87171] border border-red-500/20 hover:bg-red-500/20 transition-colors"
                          >
                            Delete
                          </button>
                        </div>
                      </td>
                    </tr>
                  ))}
                  {restaurants.length === 0 && (
                    <tr>
                      <td colSpan={6} className="px-4 py-8 text-center text-[#888888] text-sm">
                        No restaurants yet.
                      </td>
                    </tr>
                  )}
                </tbody>
              </table>
            </div>
          </div>
        )}

        {/* Add new tab */}
        {tab === "add" && (
          <form onSubmit={handleAdd} className="space-y-4 max-w-2xl">
            <FormFields f={form} setF={setForm} />
            <button
              type="submit"
              disabled={loading}
              className="w-full py-2.5 text-sm font-medium rounded-lg bg-[#FF6B35] text-white hover:bg-[#e05a28] transition-colors disabled:opacity-50"
            >
              {loading ? "Adding…" : "Add Restaurant"}
            </button>
          </form>
        )}
      </div>
    </div>
  );
}
