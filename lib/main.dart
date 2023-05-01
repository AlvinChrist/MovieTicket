import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_ticket/consts/colors.dart';
import 'package:movie_ticket/src/features/home/screens/home.dart';
import 'package:movie_ticket/pages/splash.dart';
import 'package:movie_ticket/pages/tickets.dart';
import 'package:movie_ticket/src/utils/hide_keyboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return GestureDetector(
        onTap: () {
          hideKeyboard(context);
        },
        child: MaterialApp(
          title: 'Movie App',
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          theme: ThemeData(
              textTheme: Theme.of(context).textTheme.apply(
                    fontFamily: 'Montserrat',
                    bodyColor: primaryWhite,
                    displayColor: primaryWhite,
                  )),
        ));
  }
}

class RoutingPage extends StatefulWidget {
  const RoutingPage({Key? key}) : super(key: key);

  @override
  State<RoutingPage> createState() => _RoutingPage();
}

class _RoutingPage extends State<RoutingPage> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _menuList = [
    {
      'label': 'Home',
      'icon': const Icon(
        Icons.home,
        color: primaryGrey,
      ),
      'iconActive': const Icon(
        Icons.home,
        color: primaryWhite,
      ),
      'widget': const MyHome()
    },
    {
      'label': 'Tickets',
      'icon': const Icon(
        Icons.confirmation_number_outlined,
        color: primaryGrey,
      ),
      'iconActive': const Icon(
        Icons.confirmation_number_outlined,
        color: primaryWhite,
      ),
      'widget': Tickets()
    }
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _menuList.elementAt(_selectedIndex)['widget'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: primaryGrey,
        backgroundColor: const Color(0xff383B42),
        items: _menuList.map((e) {
          return BottomNavigationBarItem(
            icon: e['icon'],
            activeIcon: e['iconActive'],
            label: e['label'],
          );
        }).toList(),
        currentIndex: _selectedIndex,
        selectedItemColor: primaryWhite,
        onTap: _onItemTapped,
      ),
    );
  }
}
