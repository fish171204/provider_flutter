import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart'; // Thêm import này

class CounterApi {
  final int _count = 100;

  int get count => _count;
}

class CounterService {
  final CounterApi _api;

  CounterService({required CounterApi api}) : _api = api;

  CounterApi get api => _api;
}

class CounterModel with ChangeNotifier {
  final CounterService _counterService;

  CounterModel({required CounterService counterService})
      : _counterService = counterService;

  CounterService get counterService => _counterService;
}

class DemoProxyProvider extends StatelessWidget {
  const DemoProxyProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CounterApi>(
          create: (_) => CounterApi(),
        ),
        // Tự động cập nhật CounterService khi CounterApi thay đổi.
        // <T,R> <=> <Type, Return>
        ProxyProvider<CounterApi, CounterService>(
          update: (context, counterApi, previous) =>
              CounterService(api: counterApi),
        ),
        ChangeNotifierProxyProvider<CounterService, CounterModel>(
          create: (_) => CounterModel(
              counterService: CounterService(
                  api: CounterApi())), // Cung cấp giá trị ban đầu
          update: (context, counterService, previous) =>
              CounterModel(counterService: counterService),
        ),
      ],
      child: const MaterialApp(
        home: TestWidget(),
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ProxyProvider Demo")),
      body: Center(
        child: Consumer<CounterModel>(
          builder: (context, model, child) => Text(
            model.counterService.api.count.toString(),
            style: const TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}
