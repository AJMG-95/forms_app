import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Importa los archivos que contienen los eventos y los estados.
part 'counter_event.dart';
part 'counter_state.dart';

// Aquí se define la clase BLoC que recibe eventos de tipo CounterEvent
// y emite estados de tipo CounterState.
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  /*
    👇 Este constructor llama al constructor de la clase base Bloc.
    Inicia el bloc con un estado por defecto: CounterState(counter: 10, transactionCount: 0)

    En otras palabras:
    - El "contador" arranca en 10
    - Aún no se ha hecho ninguna acción (transactionCount = 0)
  */
  CounterBloc() : super(const CounterState()) {
    /*
      🧩 Esta es la parte más importante: se define qué hacer cuando se recibe un evento.

      on<CounterIncreased>((event, emit) { ... })

      Esto le dice al bloc:
      👉 "Cuando recibas un evento de tipo CounterIncreased, ejecuta este código"

      `event` contiene los datos del evento (por ejemplo, cuánto aumentar)
      `emit()` se usa para mandar un nuevo estado
    */

    on<CounterIncreased>((event, emit) {
      emit(
        state.copyWith(
          counter:
              state.counter +
              event.value, // Aumenta el contador con el valor del evento
          transactionCount:
              state.transactionCount +
              1, // Cuenta cuántas veces se ha incrementado
        ),
      );
    });
  }
}
