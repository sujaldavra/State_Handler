import 'package:flutter/material.dart';
import 'package:food_ordering_app/views/screens/cart_screen.dart';
import 'package:food_ordering_app/views/screens/chat_screen.dart';
import 'package:food_ordering_app/views/screens/favorite_screen.dart';
import 'package:food_ordering_app/views/screens/home_screen.dart';
import 'package:food_ordering_app/views/screens/notification_screen.dart';
import 'package:get/get.dart';

class BottomNavigationbar extends StatefulWidget {
  const BottomNavigationbar({Key? key}) : super(key: key);

  @override
  State<BottomNavigationbar> createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  int currentTab = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const ChatScreen(),
    const NotificationScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreens = const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreens,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(Icons.shopping_cart),
        onPressed: () {
          Get.offAndToNamed("/cart_screen");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 10,),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreens = const HomeScreen();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? Colors.green : Colors.black,
                        ),
                        Text(
                          "Hpme",
                          style: TextStyle(
                            color:
                                currentTab == 0 ? Colors.green : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreens = const ChatScreen();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat,
                          color: currentTab == 1 ? Colors.green : Colors.black,
                        ),
                        Text(
                          "Chat",
                          style: TextStyle(
                            color:
                                currentTab == 1 ? Colors.green : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreens = const NotificationScreen();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications,
                          color: currentTab == 2 ? Colors.green : Colors.black,
                        ),
                        Text(
                          "Notification",
                          style: TextStyle(
                            color:
                                currentTab == 2 ? Colors.green : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreens = const FavoriteScreen();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite,
                          color: currentTab == 3 ? Colors.green : Colors.black,
                        ),
                        Text(
                          "Favorite",
                          style: TextStyle(
                            color:
                                currentTab == 3 ? Colors.green : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
