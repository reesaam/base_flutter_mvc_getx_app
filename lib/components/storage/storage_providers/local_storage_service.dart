import 'dart:convert' as convert;
import 'package:get_storage/get_storage.dart';

class LocalStorageService {
  LocalStorageService() {
    _init();
  }

  late GetStorage _storage;
  void _init() => _storage = GetStorage();

  Map<String, dynamic> get changes => _storage.changes;

  getKeys() => _storage.getKeys();

  bool hasData(String key) => _storage.hasData(key);

  dynamic read(String key) {
    final data = _storage.read(key);
    return data == null ? null : convert.jsonDecode(data.toString());
  }

  Future<void> write(String key, value) async => await _storage.write(key, convert.jsonEncode(value)).then((value) => saveOnStorage());

  remove(String key) => _storage.remove(key);

  saveOnStorage() => _storage.save();
}
