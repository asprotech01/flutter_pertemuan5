import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  final List<String> projectExperiences = const [
    'Used Smartphone Expert System - Laravel',
    'ConstructPro - PHP Company Profile',
    'BigSport - Laravel E-Commerce',
    'Drivehub - Used Car Platform',
  ];

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String userName = 'Achmad Sofyan';
  String role = 'Software Engineering Student';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController roleController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    roleController.dispose();
    super.dispose();
  }

  void editProfile(BuildContext context) {
    nameController.text = userName;
    roleController.text = role;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Edit Profil'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: roleController,
                decoration: const InputDecoration(
                  labelText: 'Program Studi',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.trim().isEmpty ||
                    roleController.text.trim().isEmpty) {
                  return;
                }

                setState(() {
                  userName = nameController.text.trim();
                  role = roleController.text.trim();
                });

                Navigator.pop(dialogContext);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profil berhasil diperbarui!')),
                );
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Profil',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profil Pengguna'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),

              /*
              PERBAIKAN KODE ORIGINAL 1

              Kode sebelumnya:
              const SizedBox(width: 16),

              Masalah:
              Widget Column menyusun elemen secara vertikal.
              Penggunaan width tidak sesuai untuk memberikan
              jarak vertikal.

              Perbaikan:
              Menggunakan height untuk mengatur jarak vertikal.
              */
              const SizedBox(height: 16),

              Column(
                children: [
                  Text(
                    userName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    role,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /*
              PERBAIKAN KODE ORIGINAL 2

              Kode sebelumnya:
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Fitur edit belum aktif pada modul statis.',
                      ),
                    ),
                  );
                },
              )

              Masalah:
              Context dari MyApp.build() berada di atas
              MaterialApp sehingga tidak dapat mengakses
              ScaffoldMessenger di dalam MaterialApp.

              Perbaikan:
              Menggunakan Builder untuk mendapatkan context
              yang berada di dalam widget tree Scaffold.
              */
              Builder(
                builder: (buttonContext) {
                  return ElevatedButton.icon(
                    onPressed: () {
                      editProfile(buttonContext);
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit Profil'),
                  );
                },
              ),

              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const StatItem(count: 'Web', label: 'Development'),

                    /*
                    PERBAIKAN KODE ORIGINAL 3

                    Kode sebelumnya:
                    const SizedBox(height: 24),

                    Masalah:
                    Widget Row menyusun elemen secara horizontal.
                    Penggunaan height tidak sesuai untuk
                    memberikan jarak horizontal.

                    Perbaikan:
                    Menggunakan width untuk mengatur
                    jarak horizontal.
                    */
                    const SizedBox(width: 24),

                    const StatItem(count: 'Mobile', label: 'Application'),
                    const SizedBox(width: 24),
                    const StatItem(count: 'UI/UX', label: 'Design'),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pengalaman & Proyek',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              const Divider(),

              /*
              PERBAIKAN KODE ORIGINAL 4

              Kode sebelumnya:
              ListView.builder(
                itemCount: experiences.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(experiences[index]),
                    ),
                  );
                },
              ),

              Masalah:
              ListView.builder berada langsung di dalam Column
              tanpa batas tinggi yang jelas. Kondisi ini dapat
              menyebabkan error unbounded height.

              Perbaikan:
              shrinkWrap membuat ListView menyesuaikan tinggi
              berdasarkan kontennya.
              NeverScrollableScrollPhysics mencegah scrolling
              bertingkat karena scrolling utama sudah ditangani
              oleh SingleChildScrollView.
              */
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.projectExperiences.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: const Icon(Icons.work, color: Colors.blueAccent),
                      title: Text(widget.projectExperiences[index]),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
PERBAIKAN KODE ORIGINAL 5

Kode sebelumnya:
StatItem(
  count: 42,
  label: 'Following',
),

Masalah:
Parameter count pada StatItem memiliki tipe data String,
sedangkan nilai 42 merupakan integer.

Perbaikan:
Nilai count menggunakan String, misalnya '42'.
Pada aplikasi ini statistik disesuaikan menjadi Web,
Mobile, dan UI/UX.
*/

class StatItem extends StatelessWidget {
  final String count;
  final String label;

  const StatItem({super.key, required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
      ],
    );
  }
}

/*
PERBAIKAN KODE ORIGINAL 6

Kode sebelumnya:

final List<String> experiences = [
  'Senior Backend Engineer - EDC Bank DKI',
  'Backend & System Architect - Secure Payment EDC',
  'Lead Developer - Aplikasi Sekurindo'
  'Backend Engineer - Pengembangan Sistem E-money',
];

Masalah:
Tidak terdapat tanda koma setelah string
'Lead Developer - Aplikasi Sekurindo'.

Akibatnya, dua string yang bersebelahan dapat
digabungkan menjadi satu data pengalaman.

Perbaikan:
Setiap item daftar pengalaman diberikan tanda koma
sebagai pemisah.
*/
