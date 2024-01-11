class TValidator {
  //kolom kosong palidasi
  static String? validateEmptyText(String? fieldName, String? value){
    if (value == null || value.isEmpty){
      return '$fieldName is required.';
    }
    return null;
  }


  static String? validateEmail(String? value){
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    //reg eks email
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]-{2,4}$');

    if (!emailRegExp.hasMatch(value)){
      return 'Invalid Email Address';
    }
    return null;
  }

  static String? validatePassword(String? value){
    if (value == null || value.isEmpty) {
      return 'Passwordd is required';
    }

    if (value.length < 6){
      return 'Password must be at least 6 (genep) charachters.';
    }
    
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must setidaknya satu kapital.';

    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must setidaknya satu nomor.';

    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must setidaknya satu spesial karakter.';

    }
    return null;
  }

  static String? validatePhoneNumber(String? value){
    if (value == null || value.isEmpty) {
      return 'Phone Number is required';
    }

    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)){
      return 'Invalid phone number format (minimal 10 digit)';
    }

    return null;
}
}