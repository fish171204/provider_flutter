import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Demo cách sử dụng Provider để chia sẻ dữ liệu giữa các widget trong Flutter mà không có tính năng cập nhật trạng thái tự động vì User không kế thừa ChangeNotifier
// Lớp User không thể cập nhật tự động nếu không kế thừa ChangeNotifier
class User {
  String _name;

  User(this._name);

  String get name => _name;
  set name(String newName) => _name = newName;
}

class BasicProvider extends StatelessWidget {
  const BasicProvider({super.key});

  @override
  Widget build(BuildContext context) {
    var user = User("Dang Khoa Nguyen");

    return Provider<User>.value(
      value: user,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text("Provider Example")),
          body: const BasicWidget(),
        ),
      ),
    );
  }
}

// Consumer
class BasicWidget extends StatelessWidget {
  const BasicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DemoConsumerWidget(),
        DemoWithoutConsumerWidget(),
      ],
    );
  }
}

// Khong Consumer
class DemoConsumerWidget extends StatelessWidget {
  const DemoConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (context, user, child) => Text("Consumer: ${user.name}"),
    );
  }
}

class DemoWithoutConsumerWidget extends StatelessWidget {
  const DemoWithoutConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // listen: false có nghĩa là widget không lắng nghe thay đổi từ User.
    User user = Provider.of<User>(context, listen: false);
    return Text("Provider.of: ${user.name}");
  }
}

void main() {
  runApp(const BasicProvider());
}
