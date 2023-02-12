import 'package:flutter/material.dart';

import 'helper/api.dart';
import 'models/castam.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => random(),
    },
  ));
}

class random extends StatefulWidget {
  const random({Key? key}) : super(key: key);

  @override
  State<random> createState() => _randomState();
}

class _randomState extends State<random> {
  dynamic? api;

  Future refresh() async {
    setState(() {
      API.api.fetchCurrency();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: FutureBuilder(
          future: API.api.fetchCurrency(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (snapshot.hasData) {
              Randomdata? data = snapshot.data;

              return (data != null)
                  ? Center(
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          Card(
                            child: Container(
                              width: 370,
                              height: 600,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  border: Border.all(
                                      color: Colors.black, width: 5)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Nametitle:- ${data.nametitle}"),
                                          Text("Namefirst:- ${data.namefirst}"),
                                          Text("Namelast:- ${data.namelast}"),
                                          Text(
                                              "Fullname:- ${data.nametitle}${data.namefirst}${data.namelast}"),
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(left: 40)),
                                      Container(
                                        width: 90,
                                        height: 90,
                                        child: Image.network("${data.picture}"),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Gender:- ${data.gender}",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 10)),
                                  Row(
                                    children: [
                                      Text(
                                        "Address:- ${data.locationstreetnumber}/${data.locationstreetname},\n${data.locationcity},${data.locationstate},\n${data.locationcountry}",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 10)),
                                  Row(
                                    children: [
                                      Text(
                                        "Postcode:- ${data.locationpostcode}",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 10)),
                                  Row(
                                    children: [
                                      Text(
                                        "email:- ${data.email}",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 10)),
                                  Row(
                                    children: [
                                      Text(
                                        "Phonenumber:- ${data.phone}",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 10)),
                                  Row(
                                    children: [
                                      Text(
                                        "Cellnumber:- ${data.cell}",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 10)),
                                  Row(
                                    children: [
                                      Text(
                                        "Date of Birth:- ${data.dobdata}",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 10)),
                                  Row(
                                    children: [
                                      Text(
                                        "Age:- ${data.age}",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 10)),
                                  Row(
                                    children: [
                                      Text(
                                        "RegisteredDate:- ${data.registereddate}",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 10)),
                                  Row(
                                    children: [
                                      Text(
                                        "RegisteredAge:- ${data.registeredage}",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                    )
                  : Center(
                      child: Text("No Data"),
                    );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
