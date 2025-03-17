import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';

// ChangeNotifierProvide
class Counter1 with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  increment() {
    _count++;
    notifyListeners(); // Gửi tín hiệu để rebuild UI
  }
}

class Counter2 with ChangeNotifier {
  int _count = 10;

  int get count => _count;
  increment() {
    _count++;
    notifyListeners(); // Gửi tín hiệu để rebuild UI
  }
}

// MultiProvider chứa nhiều ChangeNotifierProvider, mỗi cái cung cấp một lớp quản lý trạng thái (Counter1, Counter2).
// Bất kỳ widget nào trong TestWidget1 đều có thể truy cập Counter1 và Counter2.
class DemoMultipleProvider extends StatelessWidget {
  const DemoMultipleProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter1()),
        ChangeNotifierProvider(create: (_) => Counter2()),
      ],
      child: const TestWidget1(),
    );
  }
}

class TestWidget1 extends StatelessWidget {
  const TestWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    Counter1 counter1 = Provider.of<Counter1>(context);
    Counter2 counter2 = Provider.of<Counter2>(context);

    return Center(
      child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'count1 = ${counter1.count.toString()} |||||| count2 = ${counter2.count.toString()}',
                style: const TextStyle(fontSize: 25),
              ),
              TextButton(
                onPressed: () {
                  counter1.increment();
                  counter2.increment();
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
