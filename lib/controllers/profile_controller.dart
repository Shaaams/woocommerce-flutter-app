import 'package:goshopwooapp/api/api_interface.dart';
import 'package:goshopwooapp/contracts/controller.dart';
import 'package:goshopwooapp/models/customer.dart';
import 'package:goshopwooapp/models/profile.dart';

class ProfileController implements Controller{
  ApiInterface profileApi;

  ProfileController(this.profileApi);

  Future<Customer> getCustomer(int id) async {
    var data = await profileApi.gitModel(id);
    if(data != null ){
      return Customer.fromJsonMap(data);
    }
    return null;
  }

  Future<dynamic> updateProfile (int id, CustomerProfile profile) async{
    var data = await profileApi.updateProfile(id, profile);
    return Customer.fromJsonMap(data);

  }

  @override
  Future<List> getAll({int page}) {
    throw Exception('not implemented, not needed');
  }

}