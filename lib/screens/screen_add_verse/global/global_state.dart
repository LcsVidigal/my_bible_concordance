class GlobalState {
  final Map<dynamic, dynamic> _data = <dynamic, dynamic>{};

  static GlobalState instance = GlobalState._();
  GlobalState._();

  set(dynamic key, dynamic value) => _data[key] = value;
  get(dynamic key) => _data[key];
  // clear(dynamic key) => _data = null;
  
}

final GlobalState store = GlobalState.instance;