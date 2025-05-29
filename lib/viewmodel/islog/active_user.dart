class ActiveUser {
  ActiveUser._internal();

  static final ActiveUser _instance = ActiveUser._internal();

  static ActiveUser get instance => _instance;

  String _value = '';

  String get value => _value;

  set value(String newValue) {
    _value = newValue;
  }

  // Optional: clear method
  void clear() {
    _value = '';
  }
}
