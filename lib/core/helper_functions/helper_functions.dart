import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UHelperFunctions {
  UHelperFunctions._();

  // Size, Height, and Width of the Screen
  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  // Dark Mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // Given a color's name => Return a Color
  static Color? getColor(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'pink':
        return Colors.pink;
      case 'purple':
        return Colors.purple;
      case 'deep purple':
        return Colors.deepPurple;
      case 'indigo':
        return Colors.indigo;
      case 'blue':
        return Colors.blue;
      case 'light blue':
        return Colors.lightBlue;
      case 'cyan':
        return Colors.cyan;
      case 'teal':
        return Colors.teal;
      case 'green':
        return Colors.green;
      case 'light green':
        return Colors.lightGreen;
      case 'lime':
        return Colors.lime;
      case 'yellow':
        return Colors.yellow;
      case 'amber':
        return Colors.amber;
      case 'orange':
        return Colors.orange;
      case 'deep orange':
        return Colors.deepOrange;
      case 'brown':
        return Colors.brown;
      case 'grey':
        return Colors.grey;
      case 'blue grey':
        return Colors.blueGrey;
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      case 'maroon':
        return const Color(0xFF800000);
      case 'olive':
        return const Color(0xFF808000);
      case 'navy':
        return const Color(0xFF000080);
      case 'aqua':
        return const Color(0xFF00FFFF);
      case 'fuchsia':
        return const Color(0xFFFF00FF);
      case 'silver':
        return const Color(0xFFC0C0C0);
      case 'gold':
        return const Color(0xFFFFD700);
      case 'light red':
        return Colors.red.shade100;
      case 'dark red':
        return Colors.red.shade900;
      case 'light pink':
        return Colors.pink.shade100;
      case 'dark pink':
        return Colors.pink.shade900;
      case 'light purple':
        return Colors.purple.shade100;
      case 'dark purple':
        return Colors.purple.shade900;
      case 'light deep purple':
        return Colors.deepPurple.shade100;
      case 'dark deep purple':
        return Colors.deepPurple.shade900;
      case 'light indigo':
        return Colors.indigo.shade100;
      case 'dark indigo':
        return Colors.indigo.shade900;
      case 'dark blue':
        return Colors.blue.shade900;
      case 'light cyan':
        return Colors.cyan.shade100;
      case 'dark cyan':
        return Colors.cyan.shade900;
      case 'light teal':
        return Colors.teal.shade100;
      case 'dark teal':
        return Colors.teal.shade900;
      case 'dark green':
        return Colors.green.shade900;
      case 'light light green':
        return Colors.lightGreen.shade100;
      case 'dark light green':
        return Colors.lightGreen.shade900;
      case 'light lime':
        return Colors.lime.shade100;
      case 'dark lime':
        return Colors.lime.shade900;
      case 'light yellow':
        return Colors.yellow.shade100;
      case 'dark yellow':
        return Colors.yellow.shade900;
      case 'light amber':
        return Colors.amber.shade100;
      case 'dark amber':
        return Colors.amber.shade900;
      case 'light orange':
        return Colors.orange.shade100;
      case 'dark orange':
        return Colors.orange.shade900;
      case 'light deep orange':
        return Colors.deepOrange.shade100;
      case 'dark deep orange':
        return Colors.deepOrange.shade900;
      case 'light brown':
        return Colors.brown.shade100;
      case 'dark brown':
        return Colors.brown.shade900;
      case 'light grey':
        return Colors.grey.shade100;
      case 'dark grey':
        return Colors.grey.shade900;
      case 'light blue grey':
        return Colors.blueGrey.shade100;
      case 'dark blue grey':
        return Colors.blueGrey.shade900;
      case 'light black':
        return Colors.black.withOpacity(0.1);
      case 'dark black':
        return Colors.black.withOpacity(0.9);
      case 'light white':
        return Colors.white.withOpacity(0.7);
      case 'dark white':
        return Colors.white.withOpacity(0.9);
      case 'coral':
        return const Color(0xFFFF7F50);
      case 'salmon':
        return const Color(0xFFFA8072);
      case 'khaki':
        return const Color(0xFFF0E68C);
      case 'lavender':
        return const Color(0xFFE6E6FA);
      case 'turquoise':
        return const Color(0xFF40E0D0);
      case 'orchid':
        return const Color(0xFFDA70D6);
      case 'plum':
        return const Color(0xFFDDA0DD);
      case 'peach':
        return const Color(0xFFFFE5B4);
      case 'mint':
        return const Color(0xFF98FF98);
      case 'honeydew':
        return const Color(0xFFF0FFF0);
      case 'periwinkle':
        return const Color(0xFFCCCCFF);
      case 'beige':
        return const Color(0xFFF5F5DC);
      case 'ivory':
        return const Color(0xFFFFFFF0);
      default:
        return null;
    }
  }

  // Decode HTML
  String decodeHtmlEntities(String text) {
    return text
        .replaceAll('&quot;', '"')
        .replaceAll('&apos;', "'")
        .replaceAll('&#039;', "'")
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&copy;', '©')
        .replaceAll('&reg;', '®')
        .replaceAll('&euro;', '€')
        .replaceAll('&pound;', '£')
        .replaceAll('&yen;', '¥')
        .replaceAll('&cent;', '¢')
        .replaceAll('&sect;', '§')
        .replaceAll('&deg;', '°');
    // Add more replacements as needed
  }
}
