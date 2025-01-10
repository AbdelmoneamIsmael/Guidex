final onlyNumberReg = RegExp(r'[0-9]');
final onlyStringReg = RegExp(r'^[a-zA-Z0-9_-]+$');
final emailRegX = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$",
    caseSensitive: false);
