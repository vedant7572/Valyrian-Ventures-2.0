import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../service/database.dart';
import '../service/shared_pref.dart';
import '../widget/widget_support.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  String? id, wallet;
  int total=0, amount2=0;

  void startTimer(){
    Timer(const Duration(seconds: 1), () {
      amount2=total;
      setState(() {});
    });
  }

  getthesharedpref()async{
    id= await SharedPreferenceHelper().getUserId();
    wallet= await SharedPreferenceHelper().getUserWallet();
    setState(() {
    });
  }

  ontheload()async{
    await getthesharedpref();
    foodStream= await DatabaseMethods().getFoodCart(id!);
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    startTimer();
    super.initState();
  }

  Stream? foodStream;

  Widget foodCart() {
    return StreamBuilder(
        stream: foodStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: snapshot.data.docs.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.docs[index];
                total= total+ int.parse(ds["Total"]);
                return Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [

                          Container(
                            height: 90,
                            width: 40,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(child: Text(ds["Quantity"])),
                          ),//quatity circle

                          const SizedBox(
                            width: 20.0,
                          ),

                          ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                ds["Image"],
                                height: 90,
                                width: 90,
                                fit: BoxFit.cover,
                              )
                          ), //image of item

                          const SizedBox(
                            width: 20.0,
                          ),

                          Column(
                            children: [
                              Text(
                                ds["Name"],
                                style: AppWidget.semiBoldTextFieldStyle(),
                              ),
                              Text(
                                "\$"+ ds["Total"],
                                style: AppWidget.semiBoldTextFieldStyle(),
                              )
                            ],
                          ) //name and total price displayed
                        ], //individual cart item builder
                      ),
                    ),
                  ),
                );
              }
              )
              : const CircularProgressIndicator();
        }
        );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
                elevation: 2.0,
                child: Container(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Center(
                        child: Text(
                          "Food Cart",
                          style: AppWidget.headlineTextFieldStyle(),
                        )
                    )
                )
            ),//food cart text
            const SizedBox(
              height: 20.0,
            ),

            Container(
                height: MediaQuery.of(context).size.height/1.7,
                child: foodCart()
            ),
            const Spacer(),
            const Divider(),

            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Price",
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                  Text(
                    "\$"+ total.toString(),
                    style: AppWidget.semiBoldTextFieldStyle(),
                  )
                ],
              ), //total price
            ),

            const SizedBox(
              height: 20.0,
            ),

            GestureDetector(
              onTap: ()async{
                int amount= int.parse(wallet!)-amount2;
                await DatabaseMethods().updataUserWallet(id!, amount.toString());
                await SharedPreferenceHelper().saveUserWallet(amount.toString());
                await DatabaseMethods().deleteCart(id!);

                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(
                          "Order placed successfully",
                          style: TextStyle(fontSize: 20.0),
                        )
                    )
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.black, borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                child: const Center(
                    child: Text(
                      "CheckOut",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
