// ignore: unused_import
import 'package:haizz/models/course.dart';
import 'package:haizz/models/lop.dart';
import 'package:haizz/services/api_services.dart';

class ClassRepository {
  Future<List<Lop>> getListClass() async {
    List<Lop> list = [];
    // list.add(Lop(id: 1, tenhocphan: 'Lap trinh di dong', tengv: 'Giang IT'));
    var response = await ApiService().getDsLop();
    if(response != null) {
      var datas = response.data['data'];
      for(var data in datas) {
        var lop = Lop.fromJson(data);
        list.add(lop);
      }
    }
    return list;
  }
}