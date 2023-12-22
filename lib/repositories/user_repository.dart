import 'dart:io';

import 'package:haizz/models/user.dart';
import 'package:haizz/services/api_services.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

class UserRepository {
  Future<User> getUserInfo() async {
    User user = User();
    final response = await ApiService().getUserInfo();
    if (response != null) {
      var json = response.data['data'];
      user = User.fromJson(json);
    }
    return user;
  }

  Future<bool> updateProfile() async {
    bool kq = false;
    final response = await ApiService().updateProfile();
    if (response != null) {
      kq = true;
    }
    return kq;
  }

  Future<void> uploadAvatar(XFile image) async {
    ApiService api = ApiService();
    // ignore: unnecessary_null_comparison
    if(image != null) {
      //Thay doi kich thuoc anh
      final img.Image originalImage = img.decodeImage(File(image.path).readAsBytesSync())!;
      final img.Image resizedImage = img.copyResize(originalImage, width: 300); 

      //Luu vao file moi
      final File resizedFile = File(image.path.replaceAll('.jpg', '_resized.jpg'))..writeAsBytesSync(img.encodeJpg(resizedImage));

      //Gui anh da thay doi kick thuoc den server thong qua API
      await api.uploadAvatarToServer(File(resizedFile.path));
    }
  }
}