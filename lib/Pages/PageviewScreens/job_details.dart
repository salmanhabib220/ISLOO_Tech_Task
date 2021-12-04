import 'package:flutter/material.dart';
import 'package:isloo_tech_task/Pages/PageviewScreens/Google_Map.dart';
import 'package:isloo_tech_task/module/UserModule.dart';
import 'package:isloo_tech_task/widgets/elevatedbutton.dart';
import 'package:isloo_tech_task/widgets/pageview_indicator.dart';

class JobDetails extends StatefulWidget {
  final UserModel data;
  const JobDetails({Key? key, required this.data}) : super(key: key);

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [ PageView
        (
          controller: _pageController,
          children: [
          buildDetailsPage(),
          Googlemap(),
          Container(),
        ]
        ),
        CustomPageViewIndicator(_pageController),
        ]
      ),
    );
  }
  Widget buildDetailsPage() => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Padding(
             padding: const EdgeInsets.only(top: 130.0, left: 20),
             child: Container(
               height: 400,
               width: 230,
               decoration: BoxDecoration(
                 color: Colors.grey,
                 boxShadow: [
                   BoxShadow(
                       color: Colors.grey,
                       blurRadius: 10,
                       spreadRadius: 3,
                       offset: Offset(3, 4))
                 ],
               ),
               child: Image.network(
                 widget.data.image,
                 fit: BoxFit.cover,
               ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.only(left: 30.0, top: 20.0),
             child: Container(
               width: 220,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     widget.data.price.toString() + ' Ton',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.amber,
                     ),
                   ),
                   SizedBox(
                     height: 5.0,
                   ),
                   Text(
                     widget.data.title.toString(),
                     style: TextStyle(fontWeight: FontWeight.bold),
                     maxLines: 1,
                   ),
                   SizedBox(
                     height: 5.0,
                   ),
                   Text(
                     widget.data.description.toString(),
                     maxLines: 2,
                   ),
                   SizedBox(
                     height: 20.0,
                   ),
                   Center(
                     child: CustomElevatedbutton('Add to Job', 130.0),
                   ),
                 ],
               ),
             ),
           ),
         ],
       );
}
