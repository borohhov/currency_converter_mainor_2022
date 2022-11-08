import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currency_converter/controllers/persistence_controller/persistence_controller_interface.dart';

class FirestoreController implements PersistenceController {
  @override
  Future<bool?> getBool(String key) {
    // TODO: implement getBool
    throw UnimplementedError();
  }

  @override
  Future<double?> getDouble(String key) {
    // TODO: implement getDouble
    throw UnimplementedError();
  }

  @override
  Future<int?> getInt(String key) {
    // TODO: implement getInt
    throw UnimplementedError();
  }

  @override
  Future<List<String>?> getListString(String key) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    var docref = await db.collection("history").doc("allHistory").get();
    Map<String, dynamic>? test = (docref).data();
    return test?['hist'] as List<String>;
  }

  @override
  Future<String?> getString(String key) {
    // TODO: implement getString
    throw UnimplementedError();
  }

  @override
  Future<bool> saveListData(String key, List<String> data) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    Map<String, dynamic> dataToSave = {"hist": data};
    await db.collection("history").doc("allHistory").set(dataToSave);
    return true;
  }

  @override
  Future<bool> savePrimitiveData(String key, Object data) {
    // TODO: implement savePrimitiveData
    throw UnimplementedError();
  }
  
}