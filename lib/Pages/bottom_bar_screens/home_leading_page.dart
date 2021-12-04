import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:isloo_tech_task/Pages/Home_tab_bar_screens/All.dart';

class LeadingScreen extends StatelessWidget {
  const LeadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 20,
          toolbarHeight: 80,
          backgroundColor: Colors.amber,
          title: Text(
            "Listings",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 25,
                )),
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.black,
            indicatorWeight: 0.0,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.amberAccent,
            ),
            tabs: [
              Tab(child: buildContainer('All', 60.0,20.0)),
              Tab(child: buildContainer('Cranes',100.0,20.0)),
              Tab(child: buildContainer('Trailers',100.0,20.0),),
            ],
          ),
        ),
        body: TabBarView(children: [
          AllData(),
          buildpage(),
          buildpage(),
        ]),
      ),
    );
  }

  Widget buildpage() => Center(child: Text("Home"));
  Widget buildContainer(String text, double Width, double Height) => Container(
          width: Width, height: Height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            ),
        child: Align(
          alignment: Alignment.center,
          child: Text(text,style: TextStyle(fontWeight: FontWeight.bold),),
        ),
      );
}
