import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';

class DemoFutureProvider extends StatelessWidget {
  const DemoFutureProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureProvider<int>.value(
      initialData: 0, // Giá trị mặc định trước khi Future hoàn thành
      value: getAge(), // Gán Future để lấy dữ liệu
      child: const DemoFutureWidget(),
    );
  }

  Future<int> getAge() {
    return Future.delayed(const Duration(seconds: 1), () {
      return 500;
    });
  }
}

class DemoFutureWidget extends StatelessWidget {
  const DemoFutureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<int>(
      // Consumer<int> lắng nghe dữ liệu từ FutureProvider<int>
      builder: (context, value, child) {
        return Center(
          child: Text(
            value.toString(),
            style: const TextStyle(fontSize: 20),
          ),
        );
      },
    );
  }
}
