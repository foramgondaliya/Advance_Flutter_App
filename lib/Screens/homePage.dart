import 'package:adv_exam/ApiHelper/apihelper.dart';
import 'package:adv_exam/model/dataModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<allDataModel>?> getAllData;

  @override
  void initState() {
    super.initState();
    getAllData = APIhelpers.apihelpers.fetchData();
  }

  // void loadJson() {
  //   jsonData = rootBundle.toString("assets/JSON/allData.dart");
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   loadJson();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HomePage",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ),
      body: FutureBuilder(
        future: getAllData,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<allDataModel> data = snapshot.data!;

            if (data == null) {
              return Center(
                child: Text("Data is Not Available..."),
              );
            } else {
              GridView.builder(
                itemCount: data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, i) {
                  return Container(
                    height: 300,
                    width: 300,
                    color: Colors.red,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          data[i].image,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
