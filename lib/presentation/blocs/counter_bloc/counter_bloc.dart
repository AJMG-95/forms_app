import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Importa los archivos que contienen los eventos y los estados.
part 'counter_event.dart';
part 'counter_state.dart';

// 🎯 Esta clase define el Bloc, que conecta eventos (CounterEvent) con estados (CounterState)
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  /*
    👇 Este es el constructor del Bloc.
    Se llama al constructor padre (`super`) con el estado inicial que tendrá el bloc.

    En este caso:
    - El contador arranca en 10
    - transactionCount (cuántas veces se modificó) arranca en 0
  */
  CounterBloc() : super(const CounterState()) {
    /*
      🧩 Aquí definimos qué debe hacer el Bloc cuando recibe un evento específico.
      Este es el "registro" de manejadores de eventos.

      on<Evento>((evento, emit) => lógica...)

      ✅ En este caso: si llega un CounterIncreased, ejecuta _onCounterIncreased.
    */

    /* on<CounterIncreased>((event, emit) => _onCounterIncreased(event, emit)); */
    on<CounterIncreased>(_onCounterIncreased);
    on<CounterReset>(_onCounterReset);
  }

  /*
    ✅ Esta es una función "handler" separada que procesa el evento CounterIncreased.
    - `event` contiene los datos del evento (por ejemplo, `value = 3`)
    - `emit` se usa para enviar un nuevo estado al Bloc

    La lógica es:
    - Sumar el valor al contador actual
    - Aumentar el número de transacciones
    - Crear un nuevo estado y emitirlo
  */
  void _onCounterIncreased(CounterIncreased event, Emitter<CounterState> emit) {
    emit(
      state.copyWith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1,
      ),
    );
  }

  void _onCounterReset(CounterReset event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: 0));
  }

  /*
    🧩 ¿Por qué hacemos esto?

    Porque no queremos que el widget sepa demasiado sobre los eventos internos.
    Es mejor que el widget solo diga "quiero aumentar" o "quiero reiniciar",
    y que sea el BLoC el que se encargue de qué evento tiene que dispararse.

    Esto:
      - Hace el código más limpio y entendible
      - Evita repetir `.add(...)` por todas partes
      - Hace más fácil cambiar el comportamiento en el futuro (solo se cambia aquí)
  */
  void increaseBy([int value = 1]) {
    // 📤 Envia un evento CounterIncreased con el valor que se pasó
    add(CounterIncreased(value));
  }

  void resetCounter() {
    // 📤 Envia un evento CounterReset para reiniciar el contador
    add(CounterReset());
  }

}
