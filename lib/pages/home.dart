// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:valyrian_ventures/service/database.dart';

import '../widget/widget_support.dart';
import 'details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool sword = false;
  bool armor = false;
  bool food = false;
  bool necessities = false;
  Stream? allitemStream;

  ontheload() async {
    allitemStream = await DatabaseMethods().getItem("Sword");
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

  Widget allItems() {
    return StreamBuilder(
        stream: allitemStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                      detail: ds["Detail"],
                                      name: ds["Name"],
                                      price: ds["Price"],
                                      image: ds["Image"],
                                    )));
                      },
                      child: Container(
                        margin: EdgeInsets.all(4),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(14),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      ds["Image"],
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(ds["Name"],
                                      style:
                                          AppWidget.semiBoldTextFieldStyle()),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  // Text(ds["Detail"],
                                  //     style: AppWidget.lightTextFieldStyle()),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "\$" + ds["Price"],
                                    style: AppWidget.semiBoldTextFieldStyle(),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator();
        });
  }

  Widget allItemsVertically() {
    return StreamBuilder(
        stream: allitemStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                      detail: ds["Detail"],
                                      name: ds["Name"],
                                      price: ds["Price"],
                                      image: ds["Image"],
                                    )));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 20.0, bottom: 20.0),
                        height: 130,
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    ds["Image"],
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Text(
                                          ds["Name"],
                                          style: AppWidget
                                              .semiBoldTextFieldStyle(),
                                        )),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Text(
                                          ds["Detail"],
                                          style:
                                              AppWidget.lightTextFieldStyle(),
                                        )
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Text(
                                          "\$" + ds["Price"],
                                          style: AppWidget
                                              .semiBoldTextFieldStyle(),
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50, left: 20, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    "Valyrain Ventures",
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                ],
              ), //heading row

              SizedBox(
                height: 25.0,
              ),

              // Text("Survival Kit", style: AppWidget.headlineTextFieldStyle()),
              // Text("All things you need to survive the long night",
              //     style: AppWidget.lightTextFieldStyle()),
              // SizedBox(
              //   height: 20.0,
              // ),

              Container(
                  margin: EdgeInsets.only(right: 20.0),
                  child: showItem()), //the category logos

              SizedBox(
                height: 30.0,
              ),

              Container(
                height: 270,
                child: allItems(),
              ),
              SizedBox(
                height: 30.0,
              ),

              allItemsVertically(),
            ],
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            sword = true;
            armor = false;
            food = false;
            necessities = false;
            allitemStream = await DatabaseMethods().getItem("Sword");
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: sword ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "images/sword.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: sword ? Colors.white : Colors.black,
              ),
            ),
          ),
        ), //for sword
        GestureDetector(
          onTap: () async {
            sword = false;
            armor = true;
            food = false;
            necessities = false;
            allitemStream = await DatabaseMethods().getItem("Armor");
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: armor ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "images/armor.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: armor ? Colors.white : Colors.black,
              ),
            ),
          ),
        ), //for armor
        GestureDetector(
          onTap: () async {
            sword = false;
            armor = false;
            food = true;
            necessities = false;
            allitemStream = await DatabaseMethods().getItem("Food");
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: food ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "images/food.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: food ? Colors.white : Colors.black,
              ),
            ),
          ),
        ), //for food
        GestureDetector(
          onTap: () async {
            sword = false;
            armor = false;
            food = false;
            necessities = true;
            allitemStream = await DatabaseMethods().getItem("Necessities");
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: necessities ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "images/women.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: necessities ? Colors.white : Colors.black,
              ),
            ),
          ),
        ), //for women
      ],
    );
  }
}
