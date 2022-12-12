import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0.2),
        centerTitle: true,
        title: const Text(
          "Chat",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: Colors.green,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              height: 85,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.green,
              ),
              child: const ListTile(
                title: Text(
                  "Iron Man",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Avengers",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                leading: CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                      'https://www.pinkvilla.com/imageresize/robert_downey_jr_opens_up_on_playing_iron_man.jpg?width=752&t=pvorg'),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 85,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.green,
              ),
              child: const ListTile(
                title: Text(
                  "Captain America",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Avengers",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                leading: CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Chris_Evans_SDCC_2014.jpg/1200px-Chris_Evans_SDCC_2014.jpg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
