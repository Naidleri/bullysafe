import 'package:flutter/material.dart';

class DaruratScreen extends StatefulWidget {
  @override
  _DaruratScreenState createState() => _DaruratScreenState();
}

class _DaruratScreenState extends State<DaruratScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
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
              "Darurat",
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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nomor Darurat',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),
            EmergencyCard(
              title: 'Polisi',
              address: 'Jalan Jawa VII',
              phone: '9112',
              icon: "assets/images/polisi.png",
              backgroundColor: Color(0xFF4EACF0),
            ),
            const SizedBox(height: 20),
            EmergencyCard(
              title: 'Dinas Pempemberdayaan perempuan dan perlindungan anak',
              address: 'Jalan Jawa VII',
              phone: '(021) 3842638, 3805563',
              icon: "assets/images/dinas.png",
              backgroundColor: Color(0xFF4EACF0),
            ),
          ],
        ),
      ),
    );
  }
}

class EmergencyCard extends StatelessWidget {
  final String title;
  final String address;
  final String phone;
  final String icon;
  final Color backgroundColor;

  EmergencyCard({
    required this.title,
    required this.address,
    required this.phone,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: ShapeDecoration(
        color: const Color(0xFF4EACF0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Row(
        children: [
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
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      address,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.phone, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      phone,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            child: Image.asset(
              icon,
              width: 70,
              height: 70,
            ),
          )
        ],
      ),
    );
  }
}
