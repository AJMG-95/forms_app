part of 'counter_cubit.dart'; // Esto indica que este archivo forma parte del archivo principal 'counter_cubit.dart'
// y permite compartir clases entre archivos como si estuvieran en uno solo (útil para separar lógica).

class CounterState {
  // Representa el estado que maneja el Cubit.
  // En Riverpod, este sería un simple modelo de estado (como una clase usada en un `StateNotifier`).

  final int counter; // Valor actual del contador
  final transactionCount; // Cantidad de veces que el contador ha sido modificado (transacciones)

  CounterState({this.counter = 0, this.transactionCount = 0});
  // Constructor con valores por defecto: contador inicia en 0, transacciones también

  copyWith({int? counter, int? transactionCount}) => CounterState(
    counter: counter ?? this.counter,
    transactionCount: transactionCount ?? this.transactionCount,
  );
  // Método para crear una nueva instancia con cambios en campos específicos, sin modificar los demás.
  // Similar a lo que se hace en Riverpod cuando se usa `copyWith` en un `StateNotifier`.
}
