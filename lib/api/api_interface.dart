import 'package:goshopwooapp/models/profile.dart';

class ApiInterface{

  Future<List<dynamic>> getAll() async{}

  Future<dynamic> gitModel(int id) async{}

  Future<dynamic> updateProfile(int id, CustomerProfile profile) async{}
}