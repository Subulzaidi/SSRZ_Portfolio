import 'package:flutter/material.dart';
import 'package:subul_raza_zaidi/mobile/contact_mobile.dart';
import 'package:subul_raza_zaidi/mobile/landing_page_mobile.dart';
import 'package:subul_raza_zaidi/web/contact_web.dart';
import 'package:subul_raza_zaidi/web/landing_page_web.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => LayoutBuilder(builder: (context, Constraints) {
                  if (Constraints.maxWidth > 800) {
                    return LandingPageWeb();
                  } else
                    return LandingPageMobile();
                }));
      case '/Contact':
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => LayoutBuilder(builder: (context, Constraints) {
                  if (Constraints.maxWidth > 800) {
                    return ContactWeb();
                  } else
                    return ContactMobile();
                }));
      default:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => LayoutBuilder(builder: (context, Constraints) {
                  if (Constraints.maxWidth > 800) {
                    return LandingPageWeb();
                  } else
                    return LandingPageMobile();
                }));
    }
  }
}
