import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: LayoutRulesExample()));
}

class LayoutRulesExample extends StatelessWidget {
  const LayoutRulesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tiga Aturan Layout Flutter')),
      body: MyPages(),
    );
  }
}

class MyPages1 extends StatelessWidget {
  const MyPages1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '1 & 2. Aturan Constraints (Batas) dan Size (Ukuran)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Induk memaksa anak berada di batas 100x100 hingga 200x200. Anak meminta ukuran 500x50, tapi dipaksa mengikuti batas induk (mentok di lebar 200, tinggi 100).',
          ),
          const SizedBox(height: 10),

          // CONTOH ATURAN 1 & 2
          ConstrainedBox(
            // INDUK memberikan constraints ke bawah (Constraints turun)
            constraints: const BoxConstraints(
              minWidth: 100,
              maxWidth: 200,
              minHeight: 100,
              maxHeight: 200,
            ),
            // ANAK mencoba menentukan ukuran (Ukuran naik)
            child: Container(
              width:
                  150, // Mencoba lebih besar dari maxWidth (Gagal, dipaksa 200)
              height:
                  75, // Mencoba lebih kecil dari minHeight (Gagal, dipaksa 100)
              color: const Color.fromARGB(255, 243, 114, 33),
              child: const Text(
                'Saya minta 500x50, tapi dapatnya 200x100',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPages2 extends StatelessWidget {
  const MyPages2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const Divider(height: 40, thickness: 2),

          const Text(
            '3. Aturan Posisi (dengan Center)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Induk abu-abu berukuran 200x200. Kotak merah 80x80 tidak bisa menaruh dirinya di tengah, jadi kita gunakan widget Center.',
          ),
          const SizedBox(height: 10),

          // CONTOH ATURAN 3 (CENTER)
          Container(
            width: 200,
            height: 200,
            color: Colors.grey[300], // Induk yang memiliki ruang
            // Induk yang menentukan posisi
            child: Center(
              child: Container(
                width: 80,
                height: 80,
                color: Colors.red,
                child: const Text(
                  'Center',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),

          const Divider(height: 40, thickness: 2),

          const Text(
            '3. Aturan Posisi (dengan Align)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Induk abu-abu berukuran 200x200. Kotak hijau 80x80 ditempatkan di pojok kanan bawah menggunakan widget Align.',
          ),
          const SizedBox(height: 10),

          // CONTOH ATURAN 3 (ALIGN)
          Container(
            width: 200,
            height: 200,
            color: Colors.grey[300], // Induk yang memiliki ruang
            // Induk yang menentukan posisi
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 80,
                height: 80,
                color: Colors.green,
                child: const Text(
                  'Align',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPages3 extends StatelessWidget {
  const MyPages3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '3. Aturan Posisi (dengan Align [MyPages3])',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Induk abu-abu berukuran 200x200. Kotak hijau 80x80 ditempatkan di pojok kanan bawah menggunakan widget Align.',
          ),
          const SizedBox(height: 10),

          // CONTOH ATURAN 3 (ALIGN)
          Container(
            width: 200,
            height: 200,
            color: Colors.grey[300], // Induk yang memiliki ruang
            // Induk yang menentukan posisi
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 80,
                height: 80,
                color: Colors.green,
                child: const Text(
                  'Align',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPages extends StatelessWidget {
  const MyPages({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Divider(height: 40, thickness: 2),

            const MyPages1(),
            const SizedBox(height: 10),
            const MyPages2(),
            const SizedBox(height: 10),
            const MyPages3(),
            const SizedBox(height: 10),

            // CONTOH ATURAN 3 (CENTER)
            const Divider(height: 40, thickness: 2),

            // CONTOH ATURAN 3 (ALIGN)
          ],
        ),
      ),
    );
  }
}
