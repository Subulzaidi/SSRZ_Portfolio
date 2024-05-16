import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subul_raza_zaidi/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({Key? key}) : super(key: key);

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  tealContainer(String text) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 4, 77, 78),
          style: BorderStyle.solid,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: EdgeInsets.all(7.0),
      child: Text(
        text,
        style: GoogleFonts.openSans(fontSize: 15.0, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 34, 34, 34),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(size: 35.0, color: Colors.white),
      ),
      endDrawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 34, 34, 34),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DrawerHeader(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2.0, color: Colors.white),
                ),
                child: Image.asset("assets/SSRZ-cropped.png"),
              ),
            ),
            TabsMobo(text: "Home", route: "/"),
            SizedBox(height: 20.0),
            TabsMobo(text: "Works", route: "/works"),
            SizedBox(height: 20.0),
            TabsMobo(text: "Blogs", route: "/blog"),
            SizedBox(height: 20.0),
            TabsMobo(text: "About", route: "/about"),
            SizedBox(height: 20.0),
            TabsMobo(text: "Contact", route: "/contact"),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async => await launchUrl(
                      Uri.parse("https://www.instagram.com/_.subullll._/")),
                  icon: SlideFadeTransition(
                    delay: Duration(milliseconds: 100),
                    offset: Offset(0.0, 0.5),
                    child: SvgPicture.asset("assets/instagram.svg",
                        color: Colors.white, width: 35.0),
                  ),
                ),
                IconButton(
                  onPressed: () async => await launchUrl(
                      Uri.parse("https://github.com/Subulzaidi")),
                  icon: SlideFadeTransition(
                    delay: Duration(milliseconds: 200),
                    offset: Offset(0.0, 0.5),
                    child: SvgPicture.asset("assets/github.svg",
                        color: Colors.white, width: 35.0),
                  ),
                ),
                IconButton(
                  onPressed: () async => await launchUrl(Uri.parse(
                      "https://www.linkedin.com/in/subul-raza-zaidi/")),
                  icon: SlideFadeTransition(
                    delay: Duration(milliseconds: 300),
                    offset: Offset(0.0, 0.5),
                    child: SvgPicture.asset("assets/linkedIn.svg",
                        color: Colors.white, width: 35.0),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          // First section
          SizedBox(
            height: 100.0,
          ),
          Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: FadeTransition(
                opacity: _opacityAnimation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SlideTransition(
                      position: _offsetAnimation,
                      child: CircleAvatar(
                        radius: 117.0,
                        backgroundColor: Color.fromARGB(255, 4, 77, 78),
                        child: CircleAvatar(
                          radius: 110.0,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage("assets/SSRZ-cropped.png"),
                        ),
                      ),
                    ),
                    SizedBox(height: 50.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 4, 77, 78),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 15.0,
                                  horizontal: 20.0,
                                ),
                                child: SansBold("Hello, I'm", 15.0),
                              ),
                            ]),
                        SizedBox(height: 15.0),
                        SansBold("Subul Raza Zaidi", 50.0),
                        SizedBox(height: 10.0),
                        AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                              "Flutter developer",
                              textStyle: TextStyle(
                                fontSize: 25.0,
                                color: Color.fromARGB(255, 11, 132, 134),
                                fontWeight: FontWeight.bold,
                              ),
                              speed: Duration(milliseconds: 200),
                            ),
                          ],
                          totalRepeatCount: 1,
                          pause: Duration(milliseconds: 1000),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                        ),
                        SizedBox(height: 50.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SlideFadeTransition(
                              delay: Duration(milliseconds: 400),
                              offset: Offset(0.0, 0.5),
                              child: Wrap(
                                direction: Axis.vertical,
                                spacing: 3.0,
                                children: [
                                  Icon(Icons.email, color: Colors.white),
                                  Icon(Icons.call, color: Colors.white),
                                  Icon(Icons.location_pin, color: Colors.white),
                                ],
                              ),
                            ),
                            SizedBox(width: 40.0),
                            SlideFadeTransition(
                              delay: Duration(milliseconds: 550),
                              offset: Offset(0.0, 0.5),
                              child: Wrap(
                                direction: Axis.vertical,
                                spacing: 3.0,
                                children: [
                                  Sans("subul9010@gmail.com", 20.0),
                                  Sans("+92 3132221898", 20.0),
                                  Sans("Gulshan Iqbal Block 1 A-138", 20.0),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 350.0,
          ),
          // About me
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideFadeTransition(
                    delay: Duration(milliseconds: 600),
                    offset: Offset(0.0, 0.5),
                    child: SansBold("About me", 35.0),
                  ),
                  SizedBox(height: 35.0),
                  SlideFadeTransition(
                    delay: Duration(milliseconds: 700),
                    offset: Offset(0.0, 0.5),
                    child: Sans(
                      "Hello! I'm Subul Raza Zaidi. I am Learning Flutter development!  ",
                      10.0,
                    ),
                  ),
                  SlideFadeTransition(
                    delay: Duration(milliseconds: 800),
                    offset: Offset(0.0, 0.5),
                    child: Sans(
                      "I strive to ensure astounding performance with state of",
                      10.0,
                    ),
                  ),
                  SlideFadeTransition(
                    delay: Duration(milliseconds: 900),
                    offset: Offset(0.0, 0.5),
                    child: Sans(
                      "the art security for Android, iOS, Web, Mac, Linux, and Windows.",
                      10.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  SlideFadeTransition(
                    delay: Duration(milliseconds: 1000),
                    offset: Offset(0.0, 0.5),
                    child: Wrap(
                      spacing: 7.0,
                      runSpacing: 7.0,
                      children: [
                        tealContainer("Flutter"),
                        tealContainer("Android"),
                        tealContainer("Web"),
                        tealContainer("Firebase"),
                        tealContainer("React js"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100.0,
          ),
          //what i do
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SansBold("What I do?", 35.0),
              AnimatedCard(
                imagePath: "assets/webL.png",
                text: "Web development",
                width: 300.0,
              ),
              SizedBox(
                height: 35.0,
              ),
              AnimatedCard(
                  fit: BoxFit.contain,
                  imagePath: "assets/app.png",
                  reverse: true,
                  width: 300.0,
                  text: "App development"),
              SizedBox(
                height: 35.0,
              ),
              AnimatedCard(
                  imagePath: "assets/firebase.png",
                  width: 300.0,
                  text: "Back-end development"),
            ],
          ),
          SizedBox(
            height: 100.0,
          ),
          //contact
          Wrap(
              runSpacing: 20.0,
              spacing: 20.0,
              alignment: WrapAlignment.center,
              children: [
                SansBold("Contact me ", 35.0),
                TextForm(
                  text: "First Name",
                  containerwidth: widthDevice / 1.4,
                  hinttext: "Please enter your first name!",
                ),
                TextForm(
                  text: "Last Name",
                  containerwidth: widthDevice / 1.4,
                  hinttext: "Please enter your last name!",
                ),
                TextForm(
                  text: "Email",
                  containerwidth: widthDevice / 1.4,
                  hinttext: "Please enter your email!",
                ),
                TextForm(
                  text: "Phone Number",
                  containerwidth: widthDevice / 1.4,
                  hinttext: "Please enter your Phone Number!",
                ),
                TextForm(
                  text: "Message",
                  containerwidth: widthDevice / 1.4,
                  hinttext: "Please enter your Message!",
                  maxLine: 5,
                ),
                SizedBox(
                  height: 10.0,
                ),
                MaterialButton(
                    elevation: 20.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 60.0,
                    minWidth: 200.0,
                    color: Color.fromARGB(255, 4, 77, 78),
                    child: SansBold("Submit", 20.0),
                    onPressed: () {})
              ]),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
