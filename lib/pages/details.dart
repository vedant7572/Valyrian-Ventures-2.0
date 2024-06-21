import 'package:flutter/material.dart';

import '../widget/widget_support.dart';

class Details extends StatefulWidget {

  // Details(
  //     {
  //       required this.detail,
  //       required this.image,
  //       required this.name,
  //       required this.price}
  //     );
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a = 1,total=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.black,
                )),
            Image.asset(
              "images/longclaw.jpg",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Winterfell",
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                    Text(
                      "Longclaw",
                      style: AppWidget.boldTextFieldStyle(),
                    ),
                  ],//name
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    if (a > 1) {
                      --a;

                    }
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),//minus icon
                const SizedBox(
                  width: 20.0,
                ),
                Text(
                  a.toString(),
                  style: AppWidget.semiBoldTextFieldStyle(),
                ),//quantity number
                const SizedBox(
                  width: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    if(a<5){
                      ++a;

                      setState(() {});
                    }
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )//plus icon
              ],
            ),
            const SizedBox(height: 20.0,),
            Text(
              "Longclaw is a Valyrian steel sword originally belonging to House Mormont. The sword features a distinctive pommel shaped like a white wolf's head. Renowned for its sharpness and light weight, Longclaw is a formidable weapon against both human foes and White Walkers.",
              style: AppWidget.lightTextFieldStyle(),
            ),

            const SizedBox(height: 30.0),

            Row(children: [
              Text("Delivery Time", style: AppWidget.semiBoldTextFieldStyle(),),
              const SizedBox(width: 25.0,),
              const Icon(Icons.alarm, color: Colors.black54,),
              const SizedBox(width: 5.0,),
              Text("30 min", style: AppWidget.semiBoldTextFieldStyle(),)
            ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Price", style: AppWidget.semiBoldTextFieldStyle(),),
                      Text("\$$total", style: AppWidget.headlineTextFieldStyle(),)
                    ],),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text("Add to cart", style: TextStyle(color: Colors.white, fontSize: 16.0, fontFamily: 'Poppins'),),
                        const SizedBox(width: 30.0,),
                        Container(

                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.grey, borderRadius: BorderRadius.circular(8)
                          ),
                          child: const Icon(Icons.shopping_cart_outlined, color: Colors.white,),
                        ),
                        const SizedBox(width: 10.0,),
                      ],),
                  )
                ],),
            )
          ],
        ),
      ),
    );
  }
}
