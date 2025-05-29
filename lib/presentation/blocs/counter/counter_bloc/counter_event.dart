part of 'counter_bloc.dart';

/*
sealed class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

Es raro que se necesite comparar eventos, por ello no se va a usar equatable
*/

// 🔒 Sealed class: asegura que solo se puedan crear eventos específicos definidos aquí.
sealed class CounterEvent {
  const CounterEvent();
}

// 📦 Este es uno de esos eventos posibles: "aumentar el contador"
class CounterIncreased extends CounterEvent {
  final int value;

  const CounterIncreased(this.value); // Por ejemplo: CounterIncreased(3)
}

class CounterReset extends CounterEvent {}
