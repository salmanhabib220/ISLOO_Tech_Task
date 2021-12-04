import 'package:flutter/material.dart';
import 'package:isloo_tech_task/module/ApiResponce.dart';
import 'package:isloo_tech_task/widgets/elevatedbutton.dart';

class JobScreen extends StatefulWidget {
  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  var apiObj = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Jobs"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: apiObj.getUser(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(color: Colors.amber,),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
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
                            height: 10,
                          ),
                          Text(
                            snapshot.data[i].price.toString() + ' Ton',
                            style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          CustomElevatedbutton('Add to Job', 100.0),
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_outlined,
                        color: Colors.amber,
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Container();
                        }));
                      },
                    ),
                  );
                });
          }
        }
        ),
    );
  }
}
