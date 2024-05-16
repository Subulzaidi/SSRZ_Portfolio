import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class TabsWeb extends StatefulWidget {
  final title;
  final route;
  const TabsWeb({
    super.key,
    @required this.title,
    @required this.route,
  });

  @override
  State<TabsWeb> createState() => _TabsState();
}

class _TabsState extends State<TabsWeb> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(widget.route);
        },
        child: MouseRegion(
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
                  ? GoogleFonts.oswald(
                      shadows: [
                        Shadow(color: Colors.white, offset: Offset(0, -5))
                      ],
                      fontSize: 25.0,
                      color: Colors.transparent,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                      decorationColor: Colors.tealAccent,
                    )
                  : GoogleFonts.oswald(fontSize: 20.0, color: Colors.white),
              child: Text(
                widget.title,
              )),
        ));
  }
}

class TabsMobo extends StatefulWidget {
  final text;
  final route;
  const TabsMobo({super.key, @required this.text, @required this.route});

  @override
  State<TabsMobo> createState() => _TabsMoboState();
}

class _TabsMoboState extends State<TabsMobo> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 20.0,
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      height: 50.0,
      minWidth: 100.0,
      child: Text(
        widget.text,
        style: GoogleFonts.openSans(fontSize: 20.0, color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(widget.route);
      },
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
        style: GoogleFonts.openSans(
            fontSize: size, fontWeight: FontWeight.bold, color: Colors.white));
  }
}

class Sans extends StatelessWidget {
  const Sans(this.text, this.size, {super.key});

  final size;
  final text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.openSans(fontSize: size, color: Colors.white));
  }
}

class TextForm extends StatelessWidget {
  final text;
  final containerwidth;
  final hinttext;
  final maxLine;

  const TextForm({
    super.key,
    @required this.text,
    @required this.containerwidth,
    @required this.hinttext,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Sans(text, 16.0),
      SizedBox(height: 5.0),
      SizedBox(
        width: containerwidth,
        child: TextFormField(
          style: TextStyle(color: Colors.white), // Set text color to white
          maxLines: maxLine == null ? null : maxLine,
          decoration: InputDecoration(
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 4, 77, 78)),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 4, 77, 78), width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            hintText: hinttext,
            hintStyle: GoogleFonts.poppins(
                fontSize: 14, color: const Color.fromARGB(255, 59, 59, 59)),
          ),
        ),
      )
    ]);
  }
}

class AnimatedCard extends StatefulWidget {
  final String imagePath;
  final bool? reverse;
  final BoxFit? fit;
  final String text;
  final height;
  final width;
  const AnimatedCard({
    Key? key,
    this.fit,
    this.height,
    this.width,
    required this.imagePath,
    this.reverse,
    required this.text,
  }) : super(key: key);

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
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
        color: Color.fromARGB(255, 4, 77, 78),
        elevation: 30.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Color.fromARGB(255, 4, 77, 78)),
        ),
        shadowColor: Color.fromARGB(255, 6, 167, 170),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.imagePath,
                height: widget.height == null ? 200.0 : widget.height,
                width: widget.width == null ? 200.0 : widget.width,
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

class SlideFadeTransition extends StatelessWidget {
  final Widget child;
  final Duration delay;
  final Offset offset;

  const SlideFadeTransition({
    required this.child,
    required this.delay,
    required this.offset,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CurvedAnimation(
        parent: ModalRoute.of(context)!.animation!,
        curve: Interval(0.0, 1.0, curve: Curves.easeInOut),
      ),
      builder: (context, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: offset,
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: ModalRoute.of(context)!.animation!,
              curve: Interval(0.0, 1.0, curve: Curves.easeInOut),
            ),
          ),
          child: FadeTransition(
            opacity: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: ModalRoute.of(context)!.animation!,
                curve: Interval(0.0, 1.0, curve: Curves.easeInOut),
              ),
            ),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
