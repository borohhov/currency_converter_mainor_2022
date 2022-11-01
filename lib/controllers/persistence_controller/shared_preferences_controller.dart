import 'package:currency_converter/controllers/persistence_controller/persistence_controller_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController implements PersistenceController {
  late final SharedPreferences prefs;

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<bool?> getBool(String key) async {
    await initPrefs();
    return prefs.getBool(key);
  }

  @override
  Future<double?> getDouble(String key) async {
    await initPrefs();
    return prefs.getDouble(key);
  }

  @override
  Future<int?> getInt(String key) async {
    await initPrefs();
    return prefs.getInt(key);
  }

  @override
  Future<List<String>?> getListString(String key) async {
    await initPrefs();
    return prefs.getStringList(key);
  }

  @override
  Future<String?> getString(String key) async {
    await initPrefs();
    return prefs.getString(key);
  }

  @override
  Future<bool> saveListData(String key, List<String> data) async {
    await initPrefs();
    return prefs.setStringList(key, data);
  }

  @override
  Future<bool> savePrimitiveData(String key, Object data) async {
    await initPrefs();
    if(data is bool) {
      return prefs.setBool(key, data);
    }
    if(data is int) {
      return prefs.setInt(key, data);
    }
    if(data is double) {
      return prefs.setDouble(key, data);
    }
    if(data is String) {
      return prefs.setString(key, data);
    }
    throw Exception("Unknown Data Type");
  }
  
}