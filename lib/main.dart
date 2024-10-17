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
                leading: const Icon(Icons.psychology, color: Colors.blue),
                title: const Text('Tes Kesehatan Mental'),
                subtitle: const Text(
                    'Lakukan tes untuk mengetahui kondisi mentalmu.'),
                onTap: () {
                  // Navigate to test page
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.chat, color: Colors.green),
                title: const Text('Konsultasi dengan Psikolog'),
                subtitle: const Text(
                    'Mulai sesi konsultasi dengan psikolog profesional.'),
                onTap: () {
                  // Navigate to consultation page
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.book, color: Colors.orange),
                title: const Text('Jurnal Emosi Harian'),
                subtitle: const Text('Catat suasana hatimu setiap hari.'),
                onTap: () {
                  // Navigate to journal page
                },
              ),
            ),
            Card(
              child: ListTile(
                leading:
                    const Icon(Icons.self_improvement, color: Colors.purple),
                title: const Text('Sumber Bantuan Mandiri'),
                subtitle: const Text(
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

// Profil Page
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
      ),
      body: Center(
        child: Text(
          'Halaman Profil',
          style: Theme.of(context).textTheme.headlineMedium,
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
