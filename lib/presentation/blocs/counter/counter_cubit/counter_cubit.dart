import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Importa el paquete necesario para usar Cubit y BLoC

part 'counter_state.dart'; // Incluye el archivo de estado (CounterState) como parte del Cubit

class CounterCubit extends Cubit<CounterState> {
  // Cubit es una clase de BLoC que gestiona un estado y expone métodos para modificarlo
  // Similar a StateNotifier<CounterState> en Riverpod

  CounterCubit() : super(const CounterState(counter: 5));
  // El estado inicial se define al llamar al constructor del padre 'Cubit'
  // Aquí inicia el contador en 5 (valor personalizado)
  // En Riverpod usarías algo como: StateNotifierProvider((ref) => CounterNotifier())

  void increaseBy(int value) {
    // Método público para aumentar el contador

    emit(
      state.copyWith(
        counter: state.counter + value,
        transactionCount:
            state.transactionCount +
            1, // Se incrementa el número de transacciones
      ),
    );
    // 'emit' actualiza el estado del Cubit y notifica a los widgets que escuchan
    // Similar a 'state = state.copyWith(...)' en un StateNotifier de Riverpod
  }

  void reset() {
    // Método para resetear el contador a 0

    emit(state.copyWith(counter: 0));
    // Aquí solo se reinicia el contador, pero no se reinicia el transactionCount
    // Si quisieras reiniciar todo, podrías usar `emit(CounterState())`
  }
}
