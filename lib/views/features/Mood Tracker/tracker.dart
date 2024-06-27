import 'package:flutter/material.dart';
import 'package:flutter_application_bullysafe/views/features/Mood%20Tracker/mood.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TrackerScreen(),
    );
  }
}

class TrackerScreen extends StatefulWidget {
  @override
  _TrackerScreenState createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  String selectedMonth = 'Juni';

  Future<void> _selectMonth(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1, now.month),
      lastDate: DateTime(now.year + 1, now.month),
      selectableDayPredicate: (DateTime val) => val.day == 1,
    );

    if (picked != null) {
      setState(() {
        selectedMonth = "${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mood Tracker',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            fontFamily: 'Poppins',
          ),
        ),
        backgroundColor: const Color(0xFFF6F6F6),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Report Bulanan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: selectedMonth,
                suffixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
              onTap: () => _selectMonth(context),
            ),
            SizedBox(height: 20),
            Container(
              height: 200,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildMoodColumn('Senin', 'Bahagia'),
                        _buildMoodColumn('Selasa', 'Netral'),
                        _buildMoodColumn('Rabu', 'Netral'),
                        _buildMoodColumn('Kamis', 'Marah'),
                        _buildMoodColumn('Jumat', 'Sedih'),
                        _buildMoodColumn('Sabtu', 'Bahagia'),
                        _buildMoodColumn('Minggu', 'Sedih'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Hasil',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Bicaralah dengan konselor untuk mendapatkan dukungan lebih lanjut',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Yuk, Track mood kamu hari ini!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MoodTrackerScreen()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Mulai',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4EACF0),
                padding: EdgeInsets.symmetric(vertical: 16.0),
                minimumSize: Size(double.infinity, 48),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoodColumn(String day, String mood) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(mood),
        SizedBox(height: 5),
        Container(
          height: 100,
          width: 20,
          color: const Color.fromARGB(255, 90, 181, 255),
        ),
        SizedBox(height: 5),
        Text(day),
      ],
    );
  }
}
