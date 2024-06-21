import 'package:flutter/material.dart';
import 'package:valyrian_ventures/service/database.dart';

import '../service/shared_pref.dart';
import '../widget/widget_support.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  String? wallet, id;
  int? add;
  TextEditingController amountcontroller = new TextEditingController();

  getthesharedpref() async {
    wallet = await SharedPreferenceHelper().getUserWallet();
    id = await SharedPreferenceHelper().getUserId();
    setState(() {});
  }

  ontheload() async {
    await getthesharedpref();
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

  Future<void> makePayment(int amount) async{
    add=int.parse(wallet!)+amount;
    id= await SharedPreferenceHelper().getUserId();
    await SharedPreferenceHelper().saveUserWallet(add.toString());
    await DatabaseMethods().updataUserWallet(id!, add.toString());
    await getthesharedpref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
                elevation: 2.0,
                child: Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Center(
                        child: Text(
                          "Wallet",
                          style: AppWidget.headlineTextFieldStyle(),
                        )
                    )
                )
            ),  //wallet text
            const SizedBox(
              height: 30.0,
            ),


            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color(0xFFF2F2F2)),
              child: Row(
                children: [
                  Image.asset(
                    "images/wallet.png",
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),//money icon
                  const SizedBox(
                    width: 40.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Wallet",
                        style: AppWidget.lightTextFieldStyle(),
                      ),//your wallet text

                      const SizedBox(
                        height: 5.0,
                      ),

                      Text(
                        "\$ " +wallet!,
                        style: AppWidget.boldTextFieldStyle(),
                      )//money remained in the wallet
                    ],
                  )
                ],
              ),
            ),


            const SizedBox(
              height: 30.0,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0),

              child: Text(
                "Add money",
                style: AppWidget.semiBoldTextFieldStyle(),
              ),//add money text
            ),//add money text

            const SizedBox(
              height: 30.0,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    makePayment(100);
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$" + "100",
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    makePayment(500);

                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$" + "500",
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    makePayment(1000);
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$" + "1000",
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    makePayment(2000);
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "\$" + "2000",
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                  ),
                )
              ],
            ),  //money button 100,500,1000,2000

            const SizedBox(
              height: 60.0,
            ),

            GestureDetector(
              onTap: (){
                // openEdit();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.symmetric(vertical: 12.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFF008080),
                    borderRadius: BorderRadius.circular(8)),
                child: const Center(
                  child: Text(
                    "Add Money",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ) //add money button
          ],
        ),
      ),
    );
  }
}
