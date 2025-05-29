import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text('Cubits', style: textStyle.titleLarge),
            subtitle: Text(
              'Gestor de estado simple',
              style: textStyle.bodyMedium,
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              context.push('/cubits');
            },
          ),
          ListTile(
            title: Text('Blocs', style: textStyle.titleLarge),
            subtitle: Text(
              'Gestor de estado avanzado',
              style: textStyle.bodyMedium,
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              context.push('/blocs');
            },
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(),
          ),

          ListTile(
            title: Text('Nuevo usuario', style: textStyle.titleLarge),
            subtitle: Text(
              'Manejo de formulario',
              style: textStyle.bodyMedium,
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              context.push('/new-user');
            },
          ),
        ],
      ),
    );
  }
}
