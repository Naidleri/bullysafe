import 'package:flutter/material.dart';
import 'package:flutter_application_bullysafe/views/features/artikel/detailartikel.dart';

class Artikel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: AppBar(
              title: const Text(
                'Artikel',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              centerTitle: true,
              elevation: 0,
            ),
          ),
          // Artikel Cards
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Color(0xFFF6F6F6),
              child: Stack(
                children: [
                  Positioned(
                    left: 19,
                    top: 25,
                    child: Container(
                      width: 350,
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFEFEFEF),
                          prefixIcon:
                              Icon(Icons.search, color: Color(0xFF7C7C7C)),
                          hintText: 'Cari Artikel...',
                          hintStyle: TextStyle(
                            color: Color(0xFF7C7C7C),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  _buildArticleCard(
                    context,
                    title:
                        'Cara mengetahui tanda-tanda anak yang terkena bullying',
                    imageUrl: "assets/images/Discrimination.png",
                    top: 95,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailArtikel(),
                        ),
                      );
                    },
                  ),
                  _buildArticleCard(
                    context,
                    title:
                        'Cara mengatasi bullying dan mencegah dampak buruknya',
                    imageUrl: "assets/images/Bullying.png",
                    top: 270,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailArtikel(),
                        ),
                      );
                    },
                  ),
                  _buildArticleCard(
                    context,
                    title: 'Faktor penyebab dan bahayanya bullying',
                    imageUrl: "assets/images/Stop bullying.png",
                    top: 445,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailArtikel(),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    left: 0,
                    top: 664,
                    child: Container(
                      width: 414,
                      height: 60,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 414,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x0F000000),
                                    blurRadius: 20,
                                    offset: Offset(0, -5),
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 300,
                            top: 11,
                            child: Container(
                              width: 83,
                              height: 53,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 83,
                                      height: 53,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment(0.00, -1.00),
                                          end: Alignment(0, 1),
                                          colors: [
                                            Colors.white,
                                            Colors.white.withOpacity(0)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 21,
                            top: 2,
                            child: Container(
                              width: 108,
                              height: 70,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 108,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment(0.00, -1.00),
                                          end: Alignment(0, 1),
                                          colors: [Colors.white.withOpacity(0)],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 36,
                                    top: 15.56,
                                    child: Container(
                                      width: 36,
                                      height: 38.89,
                                      padding: const EdgeInsets.only(
                                        top: 3.26,
                                        left: 3,
                                        right: 3,
                                        bottom: 3.24,
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 193,
                    top: 678,
                    child: Container(
                      width: 37,
                      height: 47,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/home_icon.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArticleCard(BuildContext context,
      {required String title,
      required String imageUrl,
      required double top,
      required VoidCallback onTap}) {
    return Positioned(
      left: 20,
      top: top,
      child: InkWell(
        onTap: onTap, //
        child: Container(
          width: 345,
          height: 152,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Color(0xFF4EACF0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Color(0xFF2A2A2A),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 25),
                      Container(
                        width: 88,
                        height: 30,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xFFF6F1F1)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'View More',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  flex: 1,
                  child: Container(
                    width: 112,
                    height: 112,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imageUrl),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
