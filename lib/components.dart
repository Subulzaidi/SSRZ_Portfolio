import "package:flutter/material.dart";

import "package:google_fonts/google_fonts.dart";

class TabsWeb extends StatefulWidget {
  const TabsWeb(this.title, {super.key});

  final title;

  @override
  State<TabsWeb> createState() => _TabsState();
}

class _TabsState extends State<TabsWeb> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isSelected = true;
        });
        // print("entered");
      },
      onExit: (_) {
        setState(() {
          isSelected = false;
        });
        // print("exit");
      },
      child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 100),
          curve: Curves.elasticIn,
          style: isSelected
              ? GoogleFonts.openSans(
                  shadows: [Shadow(color: Colors.black, offset: Offset(0, -5))],
                  fontSize: 25.0,
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  decorationColor: Colors.tealAccent,
                )
              : GoogleFonts.oswald(fontSize: 23.0, color: Colors.black),
          child: Text(
            widget.title,
          )),
    );
  }
}

class SansBold extends StatelessWidget {
  const SansBold(this.text, this.size, {super.key});

  final size;
  final text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style:
            GoogleFonts.openSans(fontSize: size, fontWeight: FontWeight.bold));
  }
}

class Sans extends StatelessWidget {
  const Sans(this.text, this.size, {super.key});

  final size;
  final text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.openSans(
          fontSize: size,
        ));
  }
}

class TextForm extends StatelessWidget {
  final heading;
  final width;
  final hinttext;
  final maxLine;

  const TextForm({
    super.key,
    @required this.heading,
    @required this.width,
    @required this.hinttext,
    @required this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Sans(heading, 16.0),
      SizedBox(
        height: 5.0,
      ),
      SizedBox(
        width: width,
        child: TextFormField(
          maxLines: maxLine == null ? null : maxLine,
          decoration: InputDecoration(
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.tealAccent, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            hintText: hinttext,
            hintStyle: GoogleFonts.poppins(
              fontSize: 14,
            ),
          ),
        ),
      )
    ]);
  }
}

class AnimatedCardWeb extends StatefulWidget {
  final String imagePath;
  final bool? reverse;
  final BoxFit? fit;
  final String text;

  const AnimatedCardWeb({
    Key? key,
    this.fit,
    required this.imagePath,
    this.reverse,
    required this.text,
  }) : super(key: key);

  @override
  State<AnimatedCardWeb> createState() => _AnimatedCardWebState();
}

class _AnimatedCardWebState extends State<AnimatedCardWeb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4), // Adjust the duration for testing
    )..repeat(reverse: true);

    _animation = Tween<Offset>(
      begin: widget.reverse == true ? Offset(0, 0.08) : Offset.zero,
      end: widget.reverse == true
          ? Offset.zero
          : Offset(0, 0.08), // Adjust the end position for testing
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        color: Colors.white,
        elevation: 30.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.tealAccent),
        ),
        shadowColor: Colors.tealAccent,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.imagePath,
                height: 200.0,
                width: 200.0,
                fit: widget.fit ?? BoxFit.contain,
              ),
              SizedBox(
                height: 10.0,
              ),
              SansBold(widget.text, 15.0)
            ],
          ),
        ),
      ),
    );
  }
}
