import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lapcare/pages/welcomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carousel_slider/carousel_slider.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final _auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        color: Colors.white,
                        width: 120,
                        child: Image.asset(
                          "logoCrop.jpg",
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.solidUserCircle,
                              color: Colors.black,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.shoppingCart,
                              color: Colors.grey[600],
                            )),
                        IconButton(
                            onPressed: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                            icon: Icon(
                              FontAwesomeIcons.bars,
                              color: Colors.amberAccent,
                            ))
                      ],
                    ),
                  ])),
        ],
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 45,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.home),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(fontSize: 26),
                    ),
                  ],
                ),
                Divider()
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    Divider(),
                    Center(
                      child: Container(
                          height: 40,
                          width: 160,
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                await _auth.signOut().then((uid) async {
                                  final SharedPreferences sharedPreferences =
                                      await SharedPreferences.getInstance();
                                  sharedPreferences.remove('email');

                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => welcomePage()),
                                      (route) => false);
                                });
                              } catch (e) {
                                Navigator.of(context).pop();
                                print(e);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(e.toString())));
                              }
                            },
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                          )),
                    ),
                    Divider(),
                  ],
                )),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: CarouselSlider(
                items: [
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://www.lapcare.com/_next/image?url=https%3A%2F%2Flapcare.sgp1.digitaloceanspaces.com%2Fhome%2FMobile%2520Size-2.jpg&w=828&q=75"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://www.lapcare.com/_next/image?url=https%3A%2F%2Flapcare.sgp1.digitaloceanspaces.com%2Fbanner%2F4.jpg&w=1920&q=75"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://www.lapcare.com/_next/image?url=https%3A%2F%2Flapcare.sgp1.digitaloceanspaces.com%2Fhome%2FMobile%2520Size-3.jpg&w=828&q=75"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: 220.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "This Month's Pick",
                style: TextStyle(fontSize: 25, letterSpacing: 1.1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 40, right: 40.0),
              child: Container(
                height: 380,
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://www.lapcare.com/_next/image?url=https%3A%2F%2Flapcare.sgp1.digitaloceanspaces.com%2FComponent.jpg&w=828&q=75"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 40, right: 40.0),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                // margin: EdgeInsets.all(20.0),
                child: Container(
                  height: 380,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Container(
                          child: Image.network(
                              "https://www.lapcare.com/_next/image?url=https%3A%2F%2Flapcare.sgp1.digitaloceanspaces.com%2F2021-10-22T11-40-14.422ZLapcare%25202.5%25E2%2580%259D%2520SATA%2520SSD%2520120GB%2520%2528LOSDST7535%2529.jpg&w=640&q=75"),
                        ),
                      ),
                      Text("2.5 inch SATA SSD 120GB"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Rs. 1800"),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          height: 30,
                          width: 130,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "ADD TO CART",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.amberAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 40, right: 40.0),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                // margin: EdgeInsets.all(20.0),
                child: Container(
                  height: 380,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Container(
                          child: Image.network(
                              "https://www.lapcare.com/_next/image?url=https%3A%2F%2Flapcare.sgp1.digitaloceanspaces.com%2F2021-10-22T11-30-38.663ZLapcare%2520LAPDISC%2520NVMe%25202280%2520PCIe%2520Gen%25203%2520SSD%2520128GB%2520%2528LOSDFG7619%2529.jpg&w=640&q=75"),
                        ),
                      ),
                      Text(
                        "LAPDISC NVME 2280 PCIE GEN 3 SSD 128GB",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Rs. 2573"),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          height: 30,
                          width: 130,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "ADD TO CART",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.amberAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 40, right: 40.0),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                // margin: EdgeInsets.all(20.0),
                child: Container(
                  height: 380,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Container(
                          child: Image.network(
                              "https://www.lapcare.com/_next/image?url=https%3A%2F%2Flapcare.sgp1.digitaloceanspaces.com%2F2021-10-29T09-33-24.460ZLKMEDT6404.png&w=640&q=75"),
                        ),
                      ),
                      Text(
                        "4GB DDR4 DT RAM (2400 MHZ)",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Rs. 3249"),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          height: 30,
                          width: 130,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "ADD TO CART",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.amberAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 40, right: 40.0),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                // margin: EdgeInsets.all(20.0),
                child: Container(
                  height: 380,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Container(
                          child: Image.network(
                              "https://www.lapcare.com/_next/image?url=https%3A%2F%2Flapcare.sgp1.digitaloceanspaces.com%2F2021-10-29T10-31-46.261ZLMB%2520H61.png&w=640&q=75"),
                        ),
                      ),
                      Text(
                        "CHIPSET: INTEL® H61/SUPPORT INTEL LGA1155 SOCKETI3/I5/I7 SERIES CPU (2ND AND 3RD GEN PRO)/2 DDR3",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Rs. 4274"),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          height: 30,
                          width: 130,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "ADD TO CART",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.amberAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Trending Products",
                style: TextStyle(fontSize: 25, letterSpacing: 1.1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Card(
                color: Colors.amberAccent,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // margin: EdgeInsets.all(20.0),
                    child: Container(
                      height: 415,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Container(
                              child: Image.network(
                                  "https://www.lapcare.com/_next/image?url=https%3A%2F%2Flapcare.sgp1.digitaloceanspaces.com%2F2021-10-13T08-26-05.176ZLWS%2520040-1%2520%2528%2520HEADSET%2520%2529.jpg&w=640&q=75"),
                            ),
                          ),
                          Text(
                            "WIRED TALK HEAD SET WITH MIC",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Rs. 649"),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                              height: 30,
                              width: 130,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "ADD TO CART",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.amberAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
