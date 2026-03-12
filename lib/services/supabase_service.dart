import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/menu_model.dart';

class SupabaseService {
  final SupabaseClient _client = Supabase.instance.client;

  // READ - Ambil semua menu
  Future<List<MenuModel>> getMenus() async {
    try {
      final response = await _client
          .from('menu_cafe')
          .select()
          .order('id', ascending: true);
      
      return (response as List)
          .map((json) => MenuModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Gagal mengambil data menu: $e');
    }
  }

  // CREATE - Tambah menu baru
  Future<void> createMenu(MenuModel menu) async {
    try {
      await _client.from('menu_cafe').insert(menu.toJson());
    } catch (e) {
      throw Exception('Gagal menambah menu: $e');
    }
  }

  // UPDATE - Edit menu
  Future<void> updateMenu(MenuModel menu) async {
    try {
      await _client
          .from('menu_cafe')
          .update(menu.toJson())
          .eq('id', menu.id!);
    } catch (e) {
      throw Exception('Gagal mengupdate menu: $e');
    }
  }

  // DELETE - Hapus menu
  Future<void> deleteMenu(int id) async {
    try {
      await _client.from('menu_cafe').delete().eq('id', id);
    } catch (e) {
      throw Exception('Gagal menghapus menu: $e');
    }
  }
}