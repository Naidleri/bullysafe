import 'package:flutter/material.dart';

class Lapor2 extends StatefulWidget {
  @override
  _LaporState createState() => _LaporState();
}

class _LaporState extends State<Lapor2> {
  final TextEditingController namaPelaporController = TextEditingController();
  final TextEditingController hubunganController = TextEditingController();
  final TextEditingController namaKorbanController = TextEditingController();
  String? selectedGender;
  String? selectedViolenceType;
  String? selectedEducationLevel;
  bool isAnonymous = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                Padding(
                  padding: const EdgeInsets.only(
                    right: 25.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 16),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Deskripsi Kejadian',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color(0xFF131919),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      maxLines: 5, // Mengatur tinggi TextField
                      decoration: InputDecoration(
                        hintText: 'Deskripsikan kejadian...',
                        hintStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Upload Bukti',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color(0xFF131919),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.upload_file),
                          onPressed: () {},
                        ),
                        Text('Unggah File'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Lokasi Kejadian',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color(0xFF131919),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: () {
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
                              content:
                                  Text("Laporan Anda telah berhasil terkirim."),
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
            ),
          ),
        ],
      ),
    );
  }
}
