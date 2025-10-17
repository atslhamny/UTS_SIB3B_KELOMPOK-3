import 'package:flutter/material.dart';
import 'routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> notes = [
    'Catatan 1',
    'Catatan 2',
    'Catatan 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan Harian Pak Luqman'),
        actions: [
           IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: () {
              // Aksi untuk menu lainnya
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Aksi untuk pencarian
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Aksi untuk menu lainnya
            },
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 118, 117, 117),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.note),
              title: const Text('Semua Catatan'),
              onTap: () {
                Navigator.pushNamed(context, Routes.home);
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Catatan Bersama (Beta)'),
              onTap: () {
                Navigator.pushNamed(context, Routes.newNote);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Sampah'),
              onTap: () {
                // Aksi untuk sampah
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.folder),
              title: const Text('Folder'),
              onTap: () {
                // Aksi untuk pengaturan
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Kelola Folder'),
              onTap: () {
                // Aksi untuk pengaturan
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Card(
              color : Colors.grey[200],
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                // leading: const Icon(Icons.search),
                 title: const Text('Dapatkan catatan anda di semua perangkat',
                 style: TextStyle(fontWeight: FontWeight.bold)
                 ),
                 subtitle: const Text('Sinkronkan catatan Anda di semua perangkat dengan masuk ke akun Anda.'),
                 trailing: TextButton(
                  onPressed: () {
                  },
                  child: const Text('Cobalah'),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: notes.length,
                itemBuilder: (context, index){
                  return Card(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        notes[index],
                        style: const TextStyle(fontSize: 16),
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
      
                      ),
                    ),
                  );
                }
              ),
            ), 
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          final newNote = await Navigator.pushNamed(context, Routes.newNote);
          if (newNote != null && newNote is String && newNote.isNotEmpty) {
            setState(() {
              notes.add(newNote);
            });
          }
        },
        backgroundColor: const Color.fromARGB(255, 228, 227, 227),
        child: const Icon(Icons.edit_note, color: Color.fromARGB(255, 202, 81, 81)),
      ),
    );
  }
}