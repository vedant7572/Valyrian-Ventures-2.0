import 'package:flutter/material.dart';


import '../widget/widget_support.dart';
import 'details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool icecream = false;
  bool pizza = false;
  bool salad = false;
  bool burger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50,left: 20, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Valyrain Ventures",
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20.0),
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                  )
                ],
              ),//heading row

              SizedBox(
                height: 15.0,
              ),

              Text("Survival Kit",
                  style: AppWidget.headlineTextFieldStyle()),
              Text("All things you need to survive the long night",
                  style: AppWidget.lightTextFieldStyle()),
              SizedBox(
                height: 20.0,
              ),

              Container(
                  margin: EdgeInsets.only(right: 20.0),
                  child: showItem()
              ),//the category logos

              SizedBox(
                height: 30.0,
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Details()));
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
                                  Image.asset(
                                    "images/longclaw.jpg",
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(
                                      "Longclaw",
                                      style: AppWidget.semiBoldTextFieldStyle()
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                      "Valyrian steel sword",
                                      style: AppWidget.lightTextFieldStyle()
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "\$100",
                                    style: AppWidget.semiBoldTextFieldStyle(),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 15.0,
                    ),
                    Container(
                      margin: EdgeInsets.all(4),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(14),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "images/needle.jpg",
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                                Text("Needle",
                                    style: AppWidget.semiBoldTextFieldStyle()),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text("small & slender sword",
                                    style: AppWidget.lightTextFieldStyle()),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "\$50",
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                )
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),

              Container(
                margin: EdgeInsets.only(right: 20.0),
                height: 130,
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(

                    padding: EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "images/longclaw.jpg",
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 15.0,),
                        Column(
                          children: [
                            SizedBox(height: 10.0,),
                          Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Text("Longclaw", style: AppWidget.semiBoldTextFieldStyle(),)),
                          SizedBox(height: 5.0,),
                          Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Text("Valyrian Stell sword", style: AppWidget.lightTextFieldStyle(),)),
                          SizedBox(height: 5.0,),
                          Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Text("\$100", style: AppWidget.semiBoldTextFieldStyle(),))
                        ],)
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 30.0,
              ),
              Container(
                margin: EdgeInsets.only(right: 20.0),
                height: 130,
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(

                    padding: EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "images/dagger.jpg",
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 15.0,),
                        Column(
                          children: [
                            SizedBox(height: 10.0,),
                            Container(
                                width: MediaQuery.of(context).size.width/2,
                                child: Text("Catspaw Dagger", style: AppWidget.semiBoldTextFieldStyle(),)),
                            SizedBox(height: 5.0,),
                            Container(
                                width: MediaQuery.of(context).size.width/2,
                                child: Text("Valyrian steel blade", style: AppWidget.lightTextFieldStyle(),)),
                            SizedBox(height: 5.0,),
                            Container(
                                width: MediaQuery.of(context).size.width/2,
                                child: Text("\$150", style: AppWidget.semiBoldTextFieldStyle(),))
                          ],)
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 30.0,
              ),
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
          onTap: () {
            icecream = true;
            pizza = false;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: icecream ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "images/sword.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: icecream ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),//for sword
        GestureDetector(
          onTap: () {
            icecream = false;
            pizza = true;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: pizza ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "images/armor.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: pizza ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),//for armor
        GestureDetector(
          onTap: () {
            icecream = false;
            pizza = false;
            salad = true;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: salad ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "images/food.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: salad ? Colors.white : Colors.black,
              ),
            ),
          ),
        ), //for food
        GestureDetector(
          onTap: () {
            icecream = false;
            pizza = false;
            salad = false;
            burger = true;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: burger ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "images/women.png",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: burger ? Colors.white : Colors.black,
              ),
            ),
          ),
        ), //for women
      ],
    );
  }

}





