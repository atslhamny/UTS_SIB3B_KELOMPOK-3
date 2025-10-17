import 'package:flutter/material.dart';
import 'home_page.dart';
import 'new_note_pages.dart';

class Routes {
  static const String home = '/';
  static const String newNote = '/new_note';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case newNote:
        return MaterialPageRoute(builder: (_) => NewNotePages());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}