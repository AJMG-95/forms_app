import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Necesario para usar BlocProvider y BlocBuilder
import 'package:forms_app/presentation/blocs/cubits/counter/counter_cubit.dart'; // Importa el Cubit creado anteriormente

class CubitCounterScreen extends StatelessWidget {
  static String name =
      'cubitCounterScreen'; // Nombre estático útil para navegación
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return BlocProvider(
      create:
          (_) =>
              CounterCubit(), // Aquí se inyecta el Cubit en el árbol de widgets
      child: _CubitCounterView(
        textStyle: textStyle,
      ), // Se pasa al hijo que lo consumirá
    );

    /*
      🔁 Comparación con Riverpod:
      Aquí se usa BlocProvider para proporcionar el Cubit, parecido a cómo usarías un
      `ProviderScope` + `ref.watch(myStateNotifierProvider)` en Riverpod.
    */
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView({required this.textStyle});
  final TextTheme textStyle;

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    // 👀 context.watch<CounterCubit>().state
    // Este método escucha el Cubit y obtiene el estado actual (CounterState).
    // Cada vez que se emite un nuevo estado desde el Cubit, este widget completo se vuelve a construir.
    // Es útil si necesitas acceder a propiedades del estado fuera del BlocBuilder.
    // 🟠 CUIDADO: Si el estado cambia, TODO el método build se ejecuta de nuevo, lo que puede ser menos eficiente.
    // 🔁 En Riverpod, esto sería equivalente a: final state = ref.watch(counterProvider);
    // final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
       /*  title: Text(
          'Cubit Counter ${counterState.transactionCount}',
          style: textStyle.titleLarge,
        ), */
        actions: [
          IconButton(
            onPressed: () {
              context.read<CounterCubit>().reset();
            },
            icon: Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          // BlocBuilder escucha cambios en el estado emitido por el Cubit
          // y reconstruye **solo** el widget dentro del builder.

          // buildWhen: (previous, current) => current.counter != previous.counter,
          // ⤴️ Esto permite evitar renders innecesarios si, por ejemplo,
          //     solo quieres reconstruir si el contador cambia (no transactionCount).
          builder: (context, state) {
            // El estado más reciente del Cubit llega aquí como parámetro `state`
            // Esto hace que **solo este widget** se reconstruya cuando cambie el estado.

            return Text('Counter value: ${state.counter}');
            // Se muestra el valor actual del contador
          },
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
