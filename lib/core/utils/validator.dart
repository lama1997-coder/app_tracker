class Validator {
  // Regular expression for validating an email address
  static final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  // Regular expression for validating a password
  // Here, it requires at least one uppercase letter, one lowercase letter, one number, and one special character
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );


   static final RegExp _numberRegExp = RegExp(
    r'\d',
  );

  // Validate email
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email cannot be empty';
    } else if (!_emailRegExp.hasMatch(email)) {
      return 'Enter a valid email address';
    }
    return null; // null means the input is valid
  }

  // Validate password
  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password cannot be empty';}
    // } else if (!_passwordRegExp.hasMatch(password)) {
    //   return 'Password must be at least 8 characters long and include at least one letter and one number';
    // }
    return null; // null means the input is valid
  }


    static String? validateNumber(String? text) {
    if (text == null || text.isEmpty) {
      return 'Text cannot be empty';
    } else if (_numberRegExp.hasMatch(text)) {
      return 'Text Must not have a number';
    }
    return 'null'; // null means the input is valid
  }
}
