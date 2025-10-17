import 'package:flutter/material.dart';

class NewNotePages extends StatefulWidget{
  const NewNotePages({super.key});

  @override
  State<NewNotePages> createState() => _NewNotePagesState();
} 
  class _NewNotePagesState extends State<NewNotePages>{
    final TextEditingController _noteController = TextEditingController();

    @override
    Widget build (BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: const Text ('Judul'),
          actions: [
          IconButton(
              icon: const Icon(Icons.menu_book_outlined),
              onPressed: () {
                // Hapus catatan dan kembali ke halaman sebelumnya
                // _noteController.clear();
                // Navigator.pop(context);
              },
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                if (_noteController.text.isNotEmpty) {
                  // Simpan catatan ke database atau penyimpanan lokal
                  Navigator.pop(context, _noteController.text);
                } else {
                  // Tampilkan pesan kesalahan jika catatan kosong
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Catatan tidak boleh kosong')),
                  );
                }
              },
            ),
            IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Hapus catatan dan kembali ke halaman sebelumnya
              // _noteController.clear();
              // Navigator.pop(context);
            },
          ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            controller: _noteController,
            maxLines: null,
            decoration: const InputDecoration(
              hintText: 'Tulis catatan Anda di sini...',
              border: InputBorder.none,
            ),
          ),
        ),
      );
    }
  }