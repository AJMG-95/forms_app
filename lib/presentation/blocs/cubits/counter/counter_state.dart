part of 'counter_cubit.dart'; // Esto indica que este archivo forma parte del archivo principal 'counter_cubit.dart'
// y permite compartir clases entre archivos como si estuvieran en uno solo (útil para separar lógica).

class CounterState extends Equatable {
  // 📌 Esta clase representa el estado completo que maneja el Cubit.
  // Al extender de `Equatable`, facilitamos la comparación entre dos instancias de CounterState.
  // Esto es esencial para que el Cubit pueda saber si el estado realmente cambió o no, y evitar reconstrucciones innecesarias.


  final int counter; // Valor actual del contador
  final int transactionCount; // Cantidad de veces que el contador ha sido modificado (transacciones)

  const CounterState({this.counter = 0, this.transactionCount = 0});
  // Constructor con valores por defecto: contador inicia en 0, transacciones también

  copyWith({int? counter, int? transactionCount}) => CounterState(
    counter: counter ?? this.counter,
    transactionCount: transactionCount ?? this.transactionCount,
  );
  // Método para crear una nueva instancia con cambios en campos específicos, sin modificar los demás.
  // Similar a lo que se hace en Riverpod cuando se usa `copyWith` en un `StateNotifier`.

  @override
  List<Object> get props => [counter, transactionCount];
  // 📊 Esto define qué propiedades se utilizan para comparar dos instancias de CounterState.
  // Gracias a `Equatable`, dos instancias se consideran iguales si todas las propiedades en `props` son iguales.
  // Esto es clave para optimizar el rendimiento de Bloc/Cubit:
  //    Si el nuevo estado emitido es igual al anterior, no se reconstruye el widget.

  /*
    🟨 Comparación con Riverpod:

    - En Riverpod, los `StateNotifier` no requieren `Equatable` explícitamente, pero puedes usarlo si quieres.
    - En Cubit, `Equatable` es **altamente recomendado** para evitar actualizaciones innecesarias de widgets.
    - Sin Equatable, el Cubit podría emitir estados distintos aunque tengan los mismos datos, y eso genera reconstrucciones innecesarias.
  */
}
