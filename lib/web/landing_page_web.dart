import "package:flutter/material.dart";

import 'package:subul_raza_zaidi/components.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: Drawer(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(size: 25.0, color: Colors.black),
          title: Row(
            children: [
              Spacer(flex: 3),
              TabsWeb("Home"),
              Spacer(),
              TabsWeb("Works"),
              Spacer(),
              TabsWeb("Blog"),
              Spacer(),
              TabsWeb("About"),
              Spacer(),
              TabsWeb("Contact"),
              Spacer(flex: 1),
            ],
          ),
        ),
        body: ListView(
          children: [
            //First Section
            Container(
              height: heightDevice - 56.0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.tealAccent,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0))),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: SansBold("Hello, I'm", 15)),
                        SizedBox(height: 15.0),
                        SansBold("Subul Raza Zaidi", 55.0),
                        Sans("Flutter developer", 30.0),
                        SizedBox(height: 15.0),
                        Row(
                          children: [
                            Icon(Icons.email),
                            SizedBox(width: 20.0),
                            Sans("subul9010@gmail.com", 15.0),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Icon(Icons.call),
                            SizedBox(width: 20.0),
                            Sans("+92 3132221898", 15.0),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_pin),
                            SizedBox(width: 20.0),
                            Sans("Gulshan Iqbal Block 1 A-138", 15.0),
                          ],
                        ),
                      ],
                    ),
                    CircleAvatar(
                        radius: 147.0,
                        backgroundColor: Colors.tealAccent,
                        child: CircleAvatar(
                          radius: 143.0,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            radius: 140.0,
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage("assets/SSRZ-cropped.png"),
                          ),
                        )),
                  ]),
            ),
            // Second Section
            Container(
              height: heightDevice / 1.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/Web.jpg", height: widthDevice / 1.9),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SansBold("About Me", 40.0),
                      SizedBox(height: 15.0),
                      Sans(
                          "Hello! I'm Subul Raza Zaidi. I am Learning Flutter development!  ",
                          15.0),
                      Sans(
                          "I strive to ensure astounding performace with state of",
                          15.0),
                      Sans(
                          "the art security for Andriod, Ios, Web, Mac, Linux and Windows.",
                          15.0),
                      SizedBox(height: 10.0),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.tealAccent,
                                  style: BorderStyle.solid,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0)),
                            padding: EdgeInsets.all(7.0),
                            child: Sans("Flutter", 15.0),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.tealAccent,
                                  style: BorderStyle.solid,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0)),
                            padding: EdgeInsets.all(7.0),
                            child: Sans("React JS", 15.0),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.tealAccent,
                                  style: BorderStyle.solid,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0)),
                            padding: EdgeInsets.all(7.0),
                            child: Sans("React Native", 15.0),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.tealAccent,
                                  style: BorderStyle.solid,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0)),
                            padding: EdgeInsets.all(7.0),
                            child: Sans("Andriod", 15.0),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.tealAccent,
                                  style: BorderStyle.solid,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0)),
                            padding: EdgeInsets.all(7.0),
                            child: Sans("Firebase", 15.0),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            //Third Section
            Container(
              height: heightDevice / 1.73,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SansBold("What I do?", 40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AnimatedCardWeb(
                          imagePath: "assets/webL.png",
                          text: "Web development"),
                      AnimatedCardWeb(
                          fit: BoxFit.contain,
                          imagePath: "assets/app.png",
                          reverse: true,
                          text: "App development"),
                      AnimatedCardWeb(
                          imagePath: "assets/firebase.png",
                          text: "Back-end development"),
                    ],
                  ),
                ],
              ),
            ),

            //Fourth Section
            Container(
                height: heightDevice,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SansBold("Contact me", 40.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                TextForm(
                                  width: 350.0,
                                  heading: "First Name:",
                                  hinttext: "Please enter your first name",
                                  maxLine: 1,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextForm(
                                    heading: "Email",
                                    width: 350.0,
                                    hinttext: "Please enter your email",
                                    maxLine: 1)
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextForm(
                                  width: 350.0,
                                  heading: "Last Name:",
                                  hinttext: "Please enter your last name:",
                                  maxLine: 1,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                TextForm(
                                    heading: "Number",
                                    width: 350.0,
                                    hinttext: "Please enter your number",
                                    maxLine: 1)
                              ],
                            )
                          ]),
                      TextForm(
                          heading: "Message",
                          width: widthDevice / 1.5,
                          hinttext: "Please enter your message here",
                          maxLine: 10.0),
                      MaterialButton(
                          elevation: 20.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          height: 60.0,
                          minWidth: 200.0,
                          color: Colors.tealAccent,
                          child: SansBold("Submit", 20.0),
                          onPressed: () {})
                    ])),
            SizedBox(
              height: 20.0,
            )
          ],
        ));
  }
}
