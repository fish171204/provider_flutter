import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';

// Counter ( with ChangeNotifier) ...là một ChangeNotifier, nghĩa là nó có thể thông báo cho UI biết khi dữ liệu thay đổi.
// ChangeNotifierProvide
class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;
  increment() {
    _count++;
    notifyListeners(); // Gửi tín hiệu để rebuild UI
  }
}

// ChangeNotifierProvider tạo ra một Counter object và cung cấp nó cho toàn bộ widget con.
class DemoChangeNotifierProvider extends StatelessWidget {
  const DemoChangeNotifierProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      create: (context) => Counter(),
      child: const TestWidget(),
    );
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>(context);
    return Center(
      child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                counter.count.toString(),
                style: const TextStyle(fontSize: 40),
              ),
              TextButton(
                onPressed: () {
                  counter.increment();
                },
                child: const Text(
                  "Increment",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ]),
      ),
    );
  }
}
