import 'package:flutter/material.dart';
import 'package:flutter_application_bullysafe/models/chat.dart';
import 'package:flutter_application_bullysafe/viewmodels/chat.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  const ChatScreen({Key? key, required this.name}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ChatViewModel _chatViewModel = ChatViewModel();
  List<Chat> _chats = [];

  final Psychologist _psychologist = Psychologist();

  @override
  void initState() {
    super.initState();
    _chatViewModel.getChats().listen((chats) {
      setState(() {
        _chats = chats.reversed.toList();
      });
    });
  }

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
            title: Text(
              widget.name,
              style: const TextStyle(
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
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _chats.length,
              itemBuilder: (context, index) {
                final chat = _chats[index];
                return chat.isUser
                    ? _buildUserChat(chat)
                    : _buildPsychologistChat(chat);
              },
              reverse: true,
            ),
          ),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildUserChat(Chat chat) {
    return Container(
      padding:
          const EdgeInsets.only(right: 30.0, top: 10, bottom: 10, left: 100),
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          chat.message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildPsychologistChat(Chat chat) {
    return Container(
      padding:
          const EdgeInsets.only(left: 30.0, top: 10, bottom: 10, right: 100),
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          chat.message,
          style: const TextStyle(
            color: Color(0xFF242823),
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildInputField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: ShapeDecoration(
          color: const Color(0xFFEFEFEF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Ketik Disini...',
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
            ),
            TextButton(
              child: const Text(
                'Kirim',
                style: TextStyle(
                  color: Color(0xFF4EACF0),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () async {
                String userMessage = _controller.text;
                if (userMessage.isNotEmpty) {
                  setState(() {
                    _chats.insert(0, Chat(userMessage, true));
                  });
                  _controller.clear();
                  _triggerPsychologistResponse(userMessage);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _triggerPsychologistResponse(String userMessage) {
    String psychologistResponse = _psychologist.getResponse(userMessage);
    if (psychologistResponse != null) {
      setState(() {
        _chats.insert(0, Chat(psychologistResponse, false));
      });
    }
  }
}

class Psychologist {
  String getResponse(String userMessage) {
    Map<String, String> psychologistResponses = {
      "Halo": "Selamat datang di sesi konseling, Sampaikan keluhan Anda.",
      "Baik dok": "Istrahat yang cukup ya!",
      "Terimakasih dok": "Jangan stress lagi ya! tidak perlu khawatir!",
    };
    return psychologistResponses[userMessage] ?? "Maaf, saya tidak mengerti.";
  }
}
