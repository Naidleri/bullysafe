import 'package:flutter/material.dart';
import 'package:flutter_application_bullysafe/views/features/lapor/lapor2.dart';

class Lapor extends StatefulWidget {
  @override
  _LaporState createState() => _LaporState();
}

class _LaporState extends State<Lapor> {
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
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Formulir Pelaporan',
                        style: TextStyle(
                          color: Color(0xFF131919),
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Nama Pelapor',
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
                    if (!isAnonymous) ...[
                      TextField(
                        controller: namaPelaporController,
                        decoration: InputDecoration(
                          hintText: 'Masukkan Nama Pelapor',
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
                    ],
                    CheckboxListTile(
                      title: const Text(
                        'Anonim',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                      value: isAnonymous,
                      onChanged: (bool? value) {
                        setState(() {
                          isAnonymous = value ?? false;
                        });
                      },
                      activeColor: Color(0xFF4EACF0),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Hubungan dengan Korban',
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
                      controller: hubunganController,
                      decoration: InputDecoration(
                        hintText: 'Saudara/Teman/Orang Tua/Guru',
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
                        'Nama Korban',
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
                      controller: namaKorbanController,
                      decoration: InputDecoration(
                        hintText: 'Masukkan Nama Korban',
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
                        'Jenjang Pendidikan Korban',
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
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      hint: const Text('Pilih...'),
                      value: selectedEducationLevel,
                      items: const [
                        DropdownMenuItem(
                          value: 'Balita',
                          child: Text('Balita'),
                        ),
                        DropdownMenuItem(
                          value: 'PAUD',
                          child: Text('PAUD'),
                        ),
                        DropdownMenuItem(
                          value: 'TK',
                          child: Text('TK'),
                        ),
                        DropdownMenuItem(
                          value: 'SD',
                          child: Text('SD'),
                        ),
                        DropdownMenuItem(
                          value: 'SMP',
                          child: Text('SMP'),
                        ),
                        DropdownMenuItem(
                          value: 'SMA',
                          child: Text('SMA'),
                        ),
                        DropdownMenuItem(
                          value: 'Kuliah',
                          child: Text('Kuliah'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedEducationLevel = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Jenis Kelamin Korban',
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
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      hint: const Text('Pilih...'),
                      value: selectedGender,
                      items: const [
                        DropdownMenuItem(
                          value: 'Laki-Laki',
                          child: Text('Laki-Laki'),
                        ),
                        DropdownMenuItem(
                          value: 'Perempuan',
                          child: Text('Perempuan'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Jenis Kekerasan',
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
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      hint: const Text('Pilih...'),
                      value: selectedViolenceType,
                      items: const [
                        DropdownMenuItem(
                          value: 'Verbal',
                          child: Text('Verbal'),
                        ),
                        DropdownMenuItem(
                          value: 'Fisik',
                          child: Text('Fisik'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedViolenceType = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Lapor2(
                              namaPelapor: namaPelaporController.text,
                              hubungan: hubunganController.text,
                              namaKorban: namaKorbanController.text,
                              gender: selectedGender,
                              violenceType: selectedViolenceType,
                              educationLevel: selectedEducationLevel,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: ShapeDecoration(
                          color: const Color(0xFF4EACF0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x2B000000),
                              blurRadius: 6,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'Selanjutnya',
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
