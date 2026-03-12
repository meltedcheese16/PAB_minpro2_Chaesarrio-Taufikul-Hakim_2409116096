import 'package:flutter/material.dart';
import '../models/menu_model.dart';
import '../services/supabase_service.dart';
import '../widgets/menu_card.dart';
import 'menu_form_screen.dart';

class MenuListScreen extends StatefulWidget {
  const MenuListScreen({super.key});

  @override
  State<MenuListScreen> createState() => _MenuListScreenState();
}

class _MenuListScreenState extends State<MenuListScreen> {
  final SupabaseService _supabaseService = SupabaseService();
  late Future<List<MenuModel>> _menusFuture;

  @override
  void initState() {
    super.initState();
    _loadMenus();
  }

  void _loadMenus() {
    _menusFuture = _supabaseService.getMenus();
  }

  Future<void> _refreshMenus() async {
    setState(() {
      _loadMenus();
    });
  }

  Future<void> _deleteMenu(MenuModel menu) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi Hapus'),
        content: Text('Yakin ingin menghapus "${menu.namaMenu}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await _supabaseService.deleteMenu(menu.id!);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Menu berhasil dihapus'),
            backgroundColor: Colors.green,
          ),
        );
        _refreshMenus();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _navigateToForm({MenuModel? menu}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MenuFormScreen(menu: menu),
      ),
    );

    if (result == true) {
      _refreshMenus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              'Wakeup Social Cafe',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Manajer Menu',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        toolbarHeight: 70,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshMenus,
        color: const Color(0xFF8B4513),
        child: FutureBuilder<List<MenuModel>>(
          future: _menusFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFF8B4513)),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error, size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    Text('Error: ${snapshot.error}'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _refreshMenus,
                      child: const Text('Coba Lagi'),
                    ),
                  ],
                ),
              );
            }

            final menus = snapshot.data ?? [];

            if (menus.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.coffee_outlined,
                      size: 80,
                      color: Colors.brown[300],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Belum ada menu',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.brown[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Tap tombol + untuk menambah menu',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: menus.length,
              padding: const EdgeInsets.only(top: 8, bottom: 80),
              itemBuilder: (context, index) {
                final menu = menus[index];
                return MenuCard(
                  menu: menu,
                  onEdit: () => _navigateToForm(menu: menu),
                  onDelete: () => _deleteMenu(menu),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _navigateToForm(),
        icon: const Icon(Icons.add),
        label: const Text('Tambah Menu'),
      ),
    );
  }
}