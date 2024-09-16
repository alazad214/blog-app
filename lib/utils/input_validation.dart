class InputValidator {
  static String? validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter Your Title';
    }
    return null;
  }

  static String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter Your Title';
    }
    return null;
  }

  static String? validateAuthor(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter Your Title';
    }
    return null;
  }
}
