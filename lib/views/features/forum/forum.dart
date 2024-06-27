import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_bullysafe/models/forum.dart';
import 'package:flutter_application_bullysafe/viewmodels/forum.dart';
// import 'package:flutter_application_bullysafe/views/homepage.dart';
// import 'package:flutter_application_bullysafe/views/features/forum/addForum.dart';

class ForumScreen extends StatefulWidget {
  @override
  _ForumScreenState createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  final TextEditingController _searchController = TextEditingController();

  String _searchKeyword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
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
                Navigator.push(
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
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            SizedBox(
              height: 45,
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchKeyword = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Cari',
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Color(0xFFEFEFEF),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('forum')
                    .orderBy('timestamp', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text('No forum posts found.'));
                  }
                  final List<DocumentSnapshot> filteredDocuments =
                      snapshot.data!.docs.where((document) {
                    final forumData = document.data() as Map<String, dynamic>;
                    final content = forumData['content']?.toLowerCase() ?? '';
                    return content.contains(_searchKeyword);
                  }).toList();
                  if (filteredDocuments.isEmpty) {
                    return Center(
                        child: Text('No results found for "$_searchKeyword".'));
                  }
                  return ListView.builder(
                    itemCount: filteredDocuments.length,
                    itemBuilder: (context, index) {
                      final forumData = filteredDocuments[index].data()
                          as Map<String, dynamic>;
                      return Column(
                        children: [
                          ForumCard(
                            content: forumData['content'] ?? '',
                            commentCount: forumData['commentCount'] ?? 0,
                          ),
                          const SizedBox(height: 16),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ForumCard extends StatelessWidget {
  final String content;
  final int commentCount;

  ForumCard({
    required this.content,
    required this.commentCount,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content,
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
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(width: 0),
              Text(
                '4',
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.comment,
                color: Colors.black,
              ),
              const SizedBox(width: 4),
              Text(
                '$commentCount',
                textAlign: TextAlign.justify,
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
        ],
      ),
    );
  }
}

class AddForumScreen extends StatefulWidget {
  @override
  _AddForumScreenState createState() => _AddForumScreenState();
}

class _AddForumScreenState extends State<AddForumScreen> {
  final AddForumViewModel _viewModel = AddForumViewModel();
  final TextEditingController _contentController = TextEditingController();

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
            backgroundColor: const Color(0xFFF6F6F6),
            elevation: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 16),
              TextField(
                controller: _contentController,
                decoration: InputDecoration(
                  hintText: 'Ketik Disini...',
                  hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                  ),
                  filled: true,
                  fillColor: Color(0xFFEFEFEF),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                maxLines: 20,
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () async {
                  Forum forum = Forum(
                      username: '',
                      id: '',
                      content: _contentController.text,
                      timestamp: Timestamp.now());
                  await _viewModel.addForum(forum);
                  _contentController.clear();
                  _showSuccessDialog(context);
                },
                child: Container(
                  width: 122,
                  height: 47,
                  decoration: ShapeDecoration(
                    color: Color(0xFF4EACF0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Center(
                    child: const Text(
                      'Unggah',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
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

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Unggah Berhasil"),
          content: Text("Forum Anda berhasil diunggah."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
