import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';

// ValueNotifier là một lớp con của ChangeNotifier trong Flutter, giúp quản lý trạng thái nhẹ hơn mà không cần notifyListeners().
// ChangeNotifierProvide
class Counter {
  final ValueNotifier<int> valueNotifier = ValueNotifier(0);
}

class DemoValueListenableProvider extends StatelessWidget {
  const DemoValueListenableProvider({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider<Counter> giúp cung cấp một instance của Counter để sử dụng trong toàn bộ ứng dụng.
    return Provider<Counter>(
        create: (context) => Counter(),
        child: Consumer<Counter>(builder: (context, counter, child) {
          return ValueListenableProvider<int>.value(
              value: counter.valueNotifier,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DemoConsumerWidget(),
                    OtherWidget(),
                  ],
                ),
              ));
        }));
  }
}

class DemoConsumerWidget extends StatelessWidget {
  const DemoConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<int>(
      builder: (context, value, child) {
        return Text(
          value.toString(),
          style: const TextStyle(fontSize: 20),
        );
      },
    );
  }
}

class OtherWidget extends StatelessWidget {
  const OtherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text(
        "Increment",
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () {
        final counter = Provider.of<Counter>(context);
        counter.valueNotifier.value++;
        // Khi valueNotifier.value++, UI tự động cập nhật mà không cần notifyListeners().
      },
    );
  }
}
