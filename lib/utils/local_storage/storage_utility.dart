import 'package:get_storage/get_storage.dart';

class ULocalStorage {
  late final GetStorage _storage;

  // Static member of the class
  bool isInitialized = false;

  // Singleton instance
  static ULocalStorage? _instance;

  // Private constructor
  ULocalStorage._internal();

  // Named constructor
  factory ULocalStorage.instance() {
    _instance ??= ULocalStorage._internal();

    return _instance!;
  }

  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = ULocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
    _instance!.isInitialized = true;
  }

  // Generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Generic method to read data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  // Generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Clear all data
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
