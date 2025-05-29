import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  static String name = 'blocCounterScreen';
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: BlocCounterView(textStyle: textStyle),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({super.key, required this.textStyle});
  final TextTheme textStyle;

  /* Este método pide el contexto y de manera opcional el valor */
  void increaseCounterBy(BuildContext context, [int value = 1]) {
    /*
      context.read<CounterBloc>();
      Esta la forma de buscar en el arbol de componentes la instancia del bloc, de igual manera se accederia a la instancia del cubir
      y desde ahi se puede acceder a todos los métodos y propiedades del bloc/cubit
    */
    // context.read<CounterBloc>().add(CounterIncreased(value));
    context.read<CounterBloc>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (CounterBloc counterBloc) => Text(
            'Bloc Counter ${counterBloc.state.transactionCount}',
            style: textStyle.titleLarge,
          ),
        ),
        actions: [
          IconButton(
            //onPressed: () => context.read<CounterBloc>().add(CounterReset()),
            onPressed: () => context.read<CounterBloc>().resetCounter(),
            icon: Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Center(
        child: context.select(
          (CounterBloc counterBloc) =>
              Text('Counter value: ${counterBloc.state.counter}'),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 15,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: Text('+3', style: textStyle.bodyMedium),
            onPressed: () => increaseCounterBy(context, 3),
          ),
          FloatingActionButton(
            heroTag: '2',
            child: Text('+2', style: textStyle.bodyMedium),
            onPressed: () => increaseCounterBy(context, 2),
          ),
          FloatingActionButton(
            heroTag: '3',
            child: Text('+1', style: textStyle.bodyMedium),
            onPressed: () => increaseCounterBy(context),
          ),
        ],
      ),
    );
  }
}
