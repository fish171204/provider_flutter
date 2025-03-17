import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';

class DemoStreamProvider extends StatelessWidget {
  const DemoStreamProvider({super.key});

  @override
  Widget build(BuildContext context) {
    //  StreamProvider cung cấp dữ liệu liên tục cho widget.
    return StreamProvider<int>(
      initialData: 0, // Giá trị khởi tạo để tránh lỗi null
      create: (context) => getAge(),
      child: const DemoFutureWidget(),
    );
  }

  Stream<int> getAge() {
    return Stream.fromFuture(Future.delayed(const Duration(seconds: 1), () {
      return 250;
    }));
  }
}

class DemoFutureWidget extends StatelessWidget {
  const DemoFutureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<int>(
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
