String? validateRequired(String value) {
  if (value.isEmpty)
    return 'This field is required';
  else
    return null;
}

String? validateName(String value) {
  if (value.length < 3)
    return 'Name must be more than 2 character';
  else
    return null;
}

String? validateEmail(String value) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter a valid email';
  else
    return null;
}

String? validateMobile(String value) {
  String pattern = r'(^[0-9]{9,11}$)';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter a valid mobile number';
  else
    return null;
}