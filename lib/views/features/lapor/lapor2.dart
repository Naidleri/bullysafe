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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deskripsi Kejadian',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: deskripsiController,
                    decoration: InputDecoration(
                      hintText: 'Deskripsi...',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    ),
                    maxLines: 5,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Upload Bukti',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    color: Colors.grey[200],
                    child: InkWell(
                      onTap: _pickFile,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Icon(Icons.upload_file, color: Colors.blue),
                            SizedBox(width: 10),
                            Text(
                              'Pilih File',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (selectedFile != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'File yang dipilih: ${selectedFile!.path}',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lokasi Kejadian',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: lokasiController,
                    decoration: InputDecoration(
                      hintText: 'lokasi...',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: InkWell(
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
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                            },
                            child: Text("Tutup"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  width: size.width * 0.88,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4EACF0),
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
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
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
