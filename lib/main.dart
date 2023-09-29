import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GajiPegawai(),
    );
  }
}

class GajiPegawai extends StatefulWidget {
  @override
  _GajiPegawaiState createState() => _GajiPegawaiState();
}

class _GajiPegawaiState extends State<GajiPegawai> {
  TextEditingController kodeController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController gajiController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  double bonus = 0.0;
  double tunjangan = 0.0;
  double totalGaji = 0.0;

  void hitungGaji() {
    double gaji = double.tryParse(gajiController.text) ?? 0.0;
    String status = statusController.text.toLowerCase();

    // Menghitung bonus (10% dari gaji)     bonus = 0.1 * gaji;

    // Menghitung tunjangan berdasarkan status pernikahan     tunjangan = status == 'menikah' ? 0.08 * gaji : 0.05 * gaji;

    // Menghitung total gaji     totalGaji = gaji + bonus + tunjangan;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Gaji Pegawai'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: kodeController,
              decoration: InputDecoration(labelText: 'Kode Pegawai'),
            ),
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: 'Nama Pegawai'),
            ),
            TextField(
              controller: gajiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Gaji Pokok'),
            ),
            TextField(
              controller: statusController,
              decoration: InputDecoration(labelText: 'Status (menikah/tidak)'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                hitungGaji();
              },
              child: Text('Hitung Gaji'),
            ),
            SizedBox(height: 16.0),
            Text('Bonus: $bonus'),
            Text('Tunjangan: $tunjangan'),
            Text('Total Gaji: $totalGaji'),
          ],
        ),
      ),
    );
  }
}
