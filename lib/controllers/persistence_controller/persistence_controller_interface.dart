abstract class PersistenceController {
  Future<bool> savePrimitiveData(String key, Object data);
  Future<bool> saveListData(String key, List<String> data);

  Future<int?> getInt(String key);
  Future<double?> getDouble(String key);
  Future<bool?> getBool(String key);
  Future<String?> getString(String key);
  Future<List<String>?> getListString(String key);
}