import 'package:goshopwooapp/models/profile.dart';

class ApiInterface{

  Future<List<dynamic>> getAll({int page}) async{}

  Future<dynamic> gitModel(int id) async{}

  Future getVariations(int product) async {}

  Future<dynamic> updateProfile(int id, CustomerProfile profile) async{}
}