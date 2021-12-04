import 'package:flutter/material.dart';
import 'package:isloo_tech_task/Pages/bottom_bar_screens/home_leading_page.dart';
import 'package:isloo_tech_task/Pages/bottom_bar_screens/jobs.dart';
import 'package:isloo_tech_task/Pages/bottom_bar_screens/profile.dart';



class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentIndex = 0;
  final screens = [
    ProfileScreen(),
    LeadingScreen(),
    JobScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: screens[currentIndex],
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(14.0)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(14.0)),
              child: BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: (index) => setState(() {
                  currentIndex = index;
                }),
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.black,
                selectedItemColor: Colors.amber,
                unselectedItemColor: Colors.white,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.car_rental),
                    label: 'Jobs',
                  ),
                ],
              ),
            )));
  }
}
