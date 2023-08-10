import 'package:get/get.dart';

class LangIconsRepository extends GetConnect {
  Future<String?> getIcon(String lang) async {
    try {
      final langIcon = lang.toLowerCase();
      final icon =
          "https://cdn.jsdelivr.net/npm/programming-languages-logos/src/$langIcon/$langIcon.png";

      return icon;
    } catch (e) {
      return null;
    }
  }
}
