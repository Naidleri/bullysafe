import 'package:flutter/material.dart';
import 'package:flutter_application_bullysafe/views/features/forum/addForum.dart';

class ForumScreen extends StatefulWidget {
  @override
  _ForumScreenState createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Forum",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  fontSize: 20,
                ),
              ),
              centerTitle: true,
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => AddForumScreen()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Image.asset(
                      "assets/images/add.png",
                      width: 25,
                      height: 25,
                    ),
                  ),
                ),
              ],
              elevation: 0,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                SizedBox(
                  height: 45,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Cari',
                      hintStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Color(0xFFEFEFEF),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ForumCard(
                  pesan:
                      'Aku seorang anak berumur 12 tahun. Aku pernah mengalami dibuli hingga sampai tindak kekerasan. Karena kejadian itu, aku menjadi malas untuk pergi ke sekolah. Aku selalu merasa cemas dan ingin....',
                  jumlah: '5',
                  icon: "assets/images/komen.png",
                  backgroundColor: Colors.blue[100]!,
                ),
                const SizedBox(height: 16),
                ForumCard(
                  pesan:
                      'Aku seorang anak berumur 12 tahun. Aku pernah mengalami dibuli hingga sampai tindak kekerasan. Karena kejadian itu, aku menjadi malas untuk pergi ke sekolah. Aku selalu merasa cemas dan ingin....',
                  jumlah: '5',
                  icon: "assets/images/komen.png",
                  backgroundColor: Colors.blue[100]!,
                ),
                const SizedBox(height: 16),
                ForumCard(
                  pesan:
                      'Aku seorang anak berumur 12 tahun. Aku pernah mengalami dibuli hingga sampai tindak kekerasan. Karena kejadian itu, aku menjadi malas untuk pergi ke sekolah. Aku selalu merasa cemas dan ingin....',
                  jumlah: '5',
                  icon: "assets/images/komen.png",
                  backgroundColor: Colors.blue[100]!,
                ),
                const SizedBox(height: 16),
                ForumCard(
                  pesan:
                      'Aku seorang anak berumur 12 tahun. Aku pernah mengalami dibuli hingga sampai tindak kekerasan. Karena kejadian itu, aku menjadi malas untuk pergi ke sekolah. Aku selalu merasa cemas dan ingin....',
                  jumlah: '5',
                  icon: "assets/images/komen.png",
                  backgroundColor: Colors.blue[100]!,
                ),
                const SizedBox(height: 16),
                ForumCard(
                  pesan:
                      'Aku seorang anak berumur 12 tahun. Aku pernah mengalami dibuli hingga sampai tindak kekerasan. Karena kejadian itu, aku menjadi malas untuk pergi ke sekolah. Aku selalu merasa cemas dan ingin....',
                  jumlah: '5',
                  icon: "assets/images/komen.png",
                  backgroundColor: Colors.blue[100]!,
                ),
                const SizedBox(height: 16),
                ForumCard(
                  pesan:
                      'Aku seorang anak berumur 12 tahun. Aku pernah mengalami dibuli hingga sampai tindak kekerasan. Karena kejadian itu, aku menjadi malas untuk pergi ke sekolah. Aku selalu merasa cemas dan ingin....',
                  jumlah: '5',
                  icon: "assets/images/komen.png",
                  backgroundColor: Colors.blue[100]!,
                ),
              ],
            ),
          ),
        ));
  }
}

class ForumCard extends StatelessWidget {
  final String pesan;
  final String jumlah;
  final String icon;
  final Color backgroundColor;

  ForumCard({
    required this.pesan,
    required this.jumlah,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pesan,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  color: Color(0xFF2A2A2A),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Align(
                    child: Image.asset(
                      icon,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    jumlah,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Color(0xFF2A2A2A),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ));
  }
}
