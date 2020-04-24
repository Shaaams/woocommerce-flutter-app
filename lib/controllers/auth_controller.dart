import 'package:goshopwooapp/api/auth/auth_interface.dart';
import 'package:goshopwooapp/contracts/auth_base_controller.dart';

class AuthController implements AuthBaseController{

  AuthInterface authApi;

  AuthController(this.authApi);

  @override
  Future<int> login(Map<String, dynamic> data) async{
    var response = await authApi.login(data);
    // ToDo: Save it to the shared preferences
    return response['result'];
  }

  @override
  Future<int> register(Map<String, dynamic> data) async{
    // TODO: implement register
    return null;
  }

}