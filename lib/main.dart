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
                  // Navigate to the Journal page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => JournalEmotionPage()),
                  );
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

// Journal Emotion Page
class JournalEmotionPage extends StatefulWidget {
  @override
  _JournalEmotionPageState createState() => _JournalEmotionPageState();
}

class _JournalEmotionPageState extends State<JournalEmotionPage> {
  String? _selectedEmotion;
  final TextEditingController _noteController = TextEditingController();

  final List<String> _emotions = [
    'Bahagia',
    'Sedih',
    'Cemas',
    'Marah',
    'Tenang',
    'Bersemangat',
  ];

  void _saveJournalEntry() {
    String emotion = _selectedEmotion ?? 'Tidak dipilih';
    String note = _noteController.text.isNotEmpty
        ? _noteController.text
        : 'Tidak ada catatan';

    // Simpan data jurnal di sini, bisa dengan menyimpan ke database lokal atau remote
    print('Suasana hati: $emotion');
    print('Catatan: $note');

    // Setelah menyimpan, tampilkan pesan berhasil
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Jurnal emosi berhasil disimpan')),
    );

    // Bersihkan input
    _noteController.clear();
    setState(() {
      _selectedEmotion = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jurnal Emosi Harian'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bagaimana suasana hati Anda hari ini?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedEmotion,
              hint: const Text('Pilih suasana hati'),
              items: _emotions.map((String emotion) {
                return DropdownMenuItem<String>(
                  value: emotion,
                  child: Text(emotion),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedEmotion = newValue;
                });
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Catatan pribadi:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _noteController,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Tuliskan apa yang Anda rasakan...',
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _saveJournalEntry,
                child: const Text('Simpan Jurnal'),
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
