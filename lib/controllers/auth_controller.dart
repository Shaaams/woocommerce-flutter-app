import 'package:shared_preferences/shared_preferences.dart';
import 'package:goshopwooapp/api/auth/auth_interface.dart';
import 'package:goshopwooapp/contracts/auth_base_controller.dart';

class AuthController implements AuthBaseController{

  AuthInterface authApi;

  AuthController(this.authApi);

  @override
  Future<int> login(Map<String, dynamic > data) async {
    var response = await authApi.login(data);
    await this.saveID(response['user_id']);
    return response['user_id'];
  }

  @override
  Future<int> register(Map<String, dynamic > data) async {
    var response = await authApi.register(data);
    await this.saveID(response['user_id']);
    return response['user_id'];
  }

  @override
  Future<int> saveID(int id) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('user_id', id);
    return id;
  }

  @override
  Future<int> getID() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt('user_id');
  }

}