import 'package:flutter/material.dart';

void main() {
  runApp(const SelfloveApp());
}

class SelfloveApp extends StatelessWidget {
  const SelfloveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selflove',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    ProfilePage(),
    CalendarPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Kalender',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Home page (Tes Kesehatan Mental, Konsultasi, Jurnal, Self-Help Resources)
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Selflove - Kesehatan Mentalmu',
          style: TextStyle(
              color: Colors.white), // Mengubah warna teks menjadi putih
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications,
                color: Colors
                    .white), // Mengubah warna ikon notifikasi menjadi putih
            tooltip: 'Notifikasi',
            onPressed: () {
              // Tampilkan notifikasi
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Notifikasi'),
                    content: const Text('Belum ada notifikasi baru.'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(Icons.psychology, color: Colors.blue),
                title: Text('Tes Kesehatan Mental'),
                subtitle:
                    Text('Lakukan tes untuk mengetahui kondisi mentalmu.'),
                onTap: () {
                  // Navigate to test page
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.chat, color: Colors.green),
                title: Text('Konsultasi dengan Psikolog'),
                subtitle:
                    Text('Mulai sesi konsultasi dengan psikolog profesional.'),
                onTap: () {
                  // Navigate to consultation page
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.book, color: Colors.orange),
                title: Text('Jurnal Emosi Harian'),
                subtitle: Text('Catat suasana hatimu setiap hari.'),
                onTap: () {
                  // Navigate to journal page
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.self_improvement, color: Colors.purple),
                title: Text('Sumber Bantuan Mandiri'),
                subtitle: Text(
                    'Akses artikel, video, dan podcast terkait kesehatan mental.'),
                onTap: () {
                  // Navigate to self-help resources page
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Profil Page dengan Foto, Nama Pengguna, Email, dan Pengaturan
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Foto Profil
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://picsum.photos/id/237/200/300', // Ganti dengan URL gambar profil
              ),
            ),
            const SizedBox(height: 16),

            // Nama Pengguna
            const Text(
              'Toni sukapisang',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Email Pengguna
            const Text(
              'email@selflove.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),

            // Pengaturan
            ListTile(
              leading: Icon(Icons.settings),
              title: const Text('Pengaturan'),
              onTap: () {
                // Arahkan ke halaman pengaturan
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Pengaturan'),
                      content: const Text('Pengaturan akun dan aplikasi.'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Kalender Jadwal Konsultasi Page
class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalender Konsultasi'),
      ),
      body: Center(
        child: Text(
          'Halaman Kalender',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
