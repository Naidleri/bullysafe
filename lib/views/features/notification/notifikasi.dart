import 'package:flutter/material.dart';

class NotifikasiScreen extends StatefulWidget {
  @override
  _NotifikasiScreenState createState() => _NotifikasiScreenState();
}

class _NotifikasiScreenState extends State<NotifikasiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF6F6F6),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: AppBar(
            title: const Text(
              "Notifikasi",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            backgroundColor: const Color(0xFFF6F6F6),
            elevation: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NotifCard(
              title: 'Laporan Ditindaklanjuti',
              deskripsi:
                  'Laporan Anda tentang kasus bullying telah diterima oleh tim kami. Kami sedang melakukan investigasi lebih lanjut untuk menindaklanjuti pelaporan ini. Harap tunggu untuk mendapatkan pembaruan lebih lanjut.',
              tanggal: '28-04-24',
              icon: "assets/images/warning.png",
              backgroundColor: Colors.blue[100]!,
            ),
            const SizedBox(height: 16),
            NotifCard(
              title: 'Laporan Ditindaklanjuti',
              deskripsi:
                  'Laporan Anda tentang kasus bullying telah diterima oleh tim kami. Kami sedang melakukan investigasi lebih lanjut untuk menindaklanjuti pelaporan ini. Harap tunggu untuk mendapatkan pembaruan lebih lanjut.',
              tanggal: '28-04-24',
              icon: "assets/images/warning.png",
              backgroundColor: Colors.blue[100]!,
            ),
          ],
        ),
      ),
    );
  }
}

class NotifCard extends StatelessWidget {
  final String title;
  final String deskripsi;
  final String tanggal;
  final String icon;
  final Color backgroundColor;

  NotifCard({
    required this.title,
    required this.deskripsi,
    required this.tanggal,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Align(
            child: Image.asset(
              icon,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF242823),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.10,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  deskripsi,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: Color(0xFF242823),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  tanggal,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: Color(0xFF242823),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      SizedBox(height: 5),
      Container(
        height: 1,
        color: Color(0xFFACACAC),
        width: MediaQuery.of(context).size.width,
      ),
    ]);
  }
}
