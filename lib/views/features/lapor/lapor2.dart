import 'package:flutter/material.dart';
import 'package:flutter_application_bullysafe/models/laporan.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

import 'package:flutter_application_bullysafe/viewmodels/laporan.dart';

class Lapor2 extends StatefulWidget {
  final String namaPelapor;
  final String hubungan;
  final String namaKorban;
  final String? gender;
  final String? violenceType;
  final String? educationLevel;

  Lapor2({
    required this.namaPelapor,
    required this.hubungan,
    required this.namaKorban,
    this.gender,
    this.violenceType,
    this.educationLevel,
  });

  @override
  _Lapor2State createState() => _Lapor2State();
}

class _Lapor2State extends State<Lapor2> {
  TextEditingController deskripsiController = TextEditingController();
  TextEditingController lokasiController = TextEditingController();
  final LaporViewModel _laporViewModel = LaporViewModel();
  File? selectedFile;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
      });
    } else {
      print('Pemilihan file dibatalkan.');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF6F6F6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: AppBar(
                title: const Text(
                  "Lapor",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    fontSize: 20,
                  ),
                ),
                centerTitle: true,
                backgroundColor: Color(0xFFF6F6F6),
                elevation: 0,
                actions: [
                  const Padding(
                    padding: EdgeInsets.only(
                      right: 25.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: size.width * 0.9,
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: deskripsiController,
                decoration: InputDecoration(
                  labelText: 'Deskripsi Kejadian',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
            ),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.upload_file),
              onPressed: _pickFile,
            ),
            if (selectedFile != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('File yang dipilih: ${selectedFile!.path}'),
              ),
            Container(
              width: size.width * 0.9,
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: lokasiController,
                decoration: InputDecoration(
                  labelText: 'Lokasi Kejadian',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () async {
                Laporan laporan = Laporan(
                  username: widget.namaPelapor,
                  namaPelapor: widget.namaPelapor,
                  hubungan: widget.hubungan,
                  namaKorban: widget.namaKorban,
                  educationLevel: widget.educationLevel,
                  jenisKelaminKorban: widget.gender,
                  jenisKekerasan: widget.violenceType,
                  deskripsiKejadian: deskripsiController.text,
                  lokasiKejadian: lokasiController.text,
                );

                await _laporViewModel.addLaporan(laporan, selectedFile);

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Row(
                        children: [
                          Icon(Icons.check_circle, color: Colors.green),
                          SizedBox(width: 10),
                          Text("Laporan Berhasil"),
                        ],
                      ),
                      content: Text("Laporan Anda telah berhasil terkirim."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Tutup"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: ShapeDecoration(
                  color: const Color(0xFF4EACF0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x2B000000),
                      blurRadius: 6,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    'Kirim',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
