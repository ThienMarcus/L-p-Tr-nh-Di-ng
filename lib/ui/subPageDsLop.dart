import 'package:haizz/models/lop.dart';
import 'package:haizz/repositories/class_repository.dart';
import 'package:haizz/ui/AppConstant.dart';
import 'package:haizz/ui/custom_control.dart';
import 'package:flutter/material.dart';

import '../providers/mainViewModel.dart';

class SubPageDsLop extends StatelessWidget {
  const SubPageDsLop({super.key});
  static int idPage = 2;

  @override
  Widget build(BuildContext context) {
    final ClassRepository classRepository = ClassRepository();
    final size = MediaQuery.of(context).size;

    return GestureDetector(
        onTap: () => MainViewModel().closeMenu(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppConstant.secondaryColor,
            title: Text(
              'Danh Sách Lớp',
              style: TextStyle(
                color: AppConstant.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: FutureBuilder(
            // Hiển thị dữ liệu được tải từ Future
            future: classRepository.getListClass(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CustomSpinner(size: size);
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                List<Lop> courses = snapshot.data as List<Lop>;
                return Container(
                  color: AppConstant.mainColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Số cột trong mỗi dòng
                        crossAxisSpacing: 16.0, // Khoảng cách giữa các cột
                        mainAxisSpacing: 16.0, // Khoảng cách giữa các dòng
                      ),
                      itemCount: courses.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Text(
                                courses[index].ten,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
            },
          ),
        ));
  }
}

class CourseListModel {}