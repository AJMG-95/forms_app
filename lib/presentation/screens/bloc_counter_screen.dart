import 'package:flutter/material.dart';

class BlocCounterScreen extends StatelessWidget {
  static String name = 'blocCounterScreen';
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Counter', style: textStyle.titleLarge),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.refresh_rounded))
        ],
      ),
      body: Center(child: const Text('Counter value: xxx')),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 15,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: Text('+3', style: textStyle.bodyMedium,),
            onPressed: () {}
          ),
          FloatingActionButton(
            heroTag: '2',
            child: Text('+2', style: textStyle.bodyMedium,),
            onPressed: () {}
          ),
          FloatingActionButton(
            heroTag: '3',
            child: Text('+1', style: textStyle.bodyMedium,),
            onPressed: () {}
          ),
        ],
      ),
    );
  }
}
