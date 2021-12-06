import 'package:flutter/material.dart';
import 'package:isloo_tech_task/Pages/PageviewScreens/job_details.dart';
import 'package:isloo_tech_task/module/ApiResponce.dart';
import 'package:isloo_tech_task/widgets/elevatedbutton.dart';

class CustomListviewbuilder extends StatefulWidget {
  @override
  State<CustomListviewbuilder> createState() => _CustomListviewbuilderState();
}

class _CustomListviewbuilderState extends State<CustomListviewbuilder> {
  var apiObj = ApiService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiObj.getUser(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(color: Colors.amber,),
            );
          } else {
            return SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data == null
                          ? 0
                          : (snapshot.data.length > 4
                              ? 4
                              : snapshot.data.length),
                      itemBuilder: (context, i) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 6, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10,
                                  spreadRadius: 3,
                                  offset: Offset(3, 4))
                            ],
                          ),
                          child: ListTile(
                            leading: Image.network(
                              snapshot.data[i].image,
                              fit: BoxFit.fill,
                              width: 90,
                              height: 100,
                            ),
                            title: Text(
                              snapshot.data[i].title,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  snapshot.data[i].price.toString() + ' Ton',
                                  style: TextStyle(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                //SizedBox(height:5),
                                CustomElevatedbutton('Add to Job', 110.0),
                              ],
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.amber,
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return JobDetails(data: apiObj.users[i],);
                              }));
                            },
                          ),
                        );
                      }),
                  Padding(
                    padding: EdgeInsets.only(left: 22.0, top: 5.0),
                    child: Text("Top Machinary",style: TextStyle(fontWeight: FontWeight.bold,),),
                  ),
                  Container(
                    height: 200,
                    child: ListView.separated(
                      padding: EdgeInsets.all(20),
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      separatorBuilder: (context, _) => SizedBox(width: 10,),
                      itemBuilder: (context, index) => buildCard(snapshot.data[index])),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 22.0, top: 5.0),
                    child: Text("Other Machinary",style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    height: 100,
                    child: ListView.separated(
                      padding: EdgeInsets.all(20),
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      separatorBuilder: (context, _) => SizedBox(width: 5,),
                      itemBuilder: (context, index) => buildCard(snapshot.data[index])),
                  ),
                ],
              ),
            );
          }
        });
  }
  Widget buildCard(data) => Container(
    width: 110,
    child: AspectRatio(
      aspectRatio: 4/3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          child: Ink.image(
            image: NetworkImage(data.image),
            fit: BoxFit.cover,
            child: InkWell(
              onTap: () {         
                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return JobDetails(data: data,);
                              }));
              },
            ),
          ),
        ),
      ),
    ),
  );
}
