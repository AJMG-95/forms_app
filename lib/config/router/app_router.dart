
import 'package:forms_app/presentation/screens/screens_barrel.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/cubits',
      name: CubitCounterScreen.name,
      builder: (context, state) => const CubitCounterScreen(),
    ),
    GoRoute(
      path: '/blocs',
      name: BlocCounterScreen.name,
      builder: (context, state) => const BlocCounterScreen(),
    ),
    GoRoute(
      path: '/new-user',
      name: RegisterScreen.name,
      builder: (context, state) => const RegisterScreen(),
    ),
  ]
);
