import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final heightProvider = StateProvider<double>((_) {
  return 80;
});

final widthProvider = StateProvider<double>((_) {
  return 80;
});

class ChangeSize extends ConsumerWidget {
  const ChangeSize({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = ref.watch(heightProvider);
    final width = ref.watch(widthProvider);

    final heightChange = ref.read(heightProvider.notifier);
    final widthChange = ref.read(widthProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change shape"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.blueAccent),
              width: width,
              height: height,
              child: const Text("Text box"),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      heightChange.state += 10;
                    },
                    child: const Text("Height increase")),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      widthChange.state += 10;
                    },
                    child: const Text("Width increase"))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      heightChange.state -= 10;
                    },
                    child: const Text("Height decrease")),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      widthChange.state -= 10;
                    },
                    child: const Text("Width decrease"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
