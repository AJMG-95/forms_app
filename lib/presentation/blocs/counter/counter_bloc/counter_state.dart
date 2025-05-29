part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter; // Número actual del contador
  final int transactionCount; // Número de veces que se ha modificado el contador

  const CounterState({this.counter = 10, this.transactionCount = 0});
  // Estado inicial: contador empieza en 10, sin transacciones

  CounterState copyWith({int? counter, int? transactionCount}) => CounterState(
    counter: counter ?? this.counter,
    transactionCount: transactionCount ?? this.transactionCount,
  );
  // 🧱 Método para crear una nueva versión del estado actual cambiando solo lo necesario

  @override
  List<Object> get props => [counter, transactionCount];
  // 🔍 Esto es para que Equatable pueda comparar dos estados y saber si realmente cambiaron
}

/*
final class CounterInitial extends CounterState {}

Se puede definir un estaddo de iniciacion para el bloc
*/
