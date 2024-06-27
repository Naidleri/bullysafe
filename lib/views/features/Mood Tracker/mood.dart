import 'package:flutter/material.dart';

class MoodTrackerScreen extends StatefulWidget {
  @override
  _MoodTrackerScreenState createState() => _MoodTrackerScreenState();
}

class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
  String? mood;
  String? eventDescription;
  int anxietyLevel = 1;
  int stressLevel = 1;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1. Bagaimana perasaanmu hari ini?',
                style: TextStyle(fontSize: 16),
              ),
              ..._buildMoodOptions(),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2. ',
                    style: TextStyle(fontSize: 16),
                  ),
                  Expanded(
                    child: Text(
                      'Apakah ada peristiwa tertentu yang mempengaruhi suasana hatimu hari ini?',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      eventDescription = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Tuliskan peristiwa di sini...',
                  ),
                  maxLines: 3,
                ),
              ),
              SizedBox(height: 16),
              Text(
                '3. Seberapa cemas kamu merasa hari ini?',
                style: TextStyle(fontSize: 16),
              ),
              ..._buildAnxietyOptions(),
              SizedBox(height: 16),
              Text(
                '4. Seberapa stres kamu merasa hari ini?',
                style: TextStyle(fontSize: 16),
              ),
              ..._buildStressOptions(),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle form submission
                    print('Mood: $mood');
                    print('Event: $eventDescription');
                    print('Anxiety Level: $anxietyLevel');
                    print('Stress Level: $stressLevel');
                    //show dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Row(
                            children: [
                              Icon(Icons.check_circle, color: Colors.green),
                              SizedBox(width: 10),
                              Text("Tracker Berhasil"),
                            ],
                          ),
                          content: Text(
                              "Mood Tracker Anda telah berhasil terkirim."),
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4EACF0),
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
    );
  }

  List<Widget> _buildMoodOptions() {
    return [
      RadioListTile<String>(
        title: const Text('Bahagia'),
        value: 'Bahagia',
        groupValue: mood,
        activeColor: Color(0xFF4EACF0),
        onChanged: (String? value) {
          setState(() {
            mood = value;
          });
        },
      ),
      RadioListTile<String>(
        title: const Text('Netral'),
        value: 'Netral',
        groupValue: mood,
        activeColor: Color(0xFF4EACF0),
        onChanged: (String? value) {
          setState(() {
            mood = value;
          });
        },
      ),
      RadioListTile<String>(
        title: const Text('Sedih'),
        value: 'Sedih',
        groupValue: mood,
        activeColor: Color(0xFF4EACF0),
        onChanged: (String? value) {
          setState(() {
            mood = value;
          });
        },
      ),
      RadioListTile<String>(
        title: const Text('Marah'),
        value: 'Marah',
        groupValue: mood,
        activeColor: Color(0xFF4EACF0),
        onChanged: (String? value) {
          setState(() {
            mood = value;
          });
        },
      ),
    ];
  }

  List<Widget> _buildAnxietyOptions() {
    return List<Widget>.generate(4, (index) {
      return RadioListTile<int>(
        title: Text('${index + 1}'),
        value: index + 1,
        groupValue: anxietyLevel,
        activeColor: Color(0xFF4EACF0),
        onChanged: (int? value) {
          setState(() {
            anxietyLevel = value!;
          });
        },
      );
    });
  }

  List<Widget> _buildStressOptions() {
    return List<Widget>.generate(4, (index) {
      return RadioListTile<int>(
        title: Text('${index + 1}'),
        value: index + 1,
        groupValue: stressLevel,
        activeColor: Color(0xFF4EACF0),
        onChanged: (int? value) {
          setState(() {
            stressLevel = value!;
          });
        },
      );
    });
  }
}
