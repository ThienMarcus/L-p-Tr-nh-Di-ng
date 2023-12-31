import 'package:haizz/services/api_services.dart';

class ForgotPassRepository {
  final ApiService api = ApiService();
  Future<bool> forgotPassword(String email) async {
    
    final response = await api.forgotPassword(email);
    if (response != null) {
      return true;
    } else {
      return false;
    }
  }
}