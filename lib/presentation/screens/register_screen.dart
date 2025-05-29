import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  static String name = 'registerScreen';
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Usuario')),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              FlutterLogo(size: 100),

              _RegisterForm(),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => __RegisterFormState();
}

class __RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   // 🔑 Esta llave se usa para validar todo el formulario (verificar si todos los campos son correctos)

  String username = '';
  String email = '';
  String password = '';
  // 🧠 Estas son las variables donde se guarda lo que escribe el usuario


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            prefixIcon: Icons.perm_identity_sharp,
            onChanged:
                (value) => username = value, // Guarda el texto en la variable
            validator: (value) {
              final v = value;
              if (v == null || v.trim().isEmpty)return 'Se requiere un nombre de usuario.';
              if (v.trim().length < 6)return 'El nombre de usuario debe tener al menos 6 caracteres.';
              return null; // ✅ Si pasa todas las validaciones
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Correo electronico',
            prefixIcon: Icons.email_outlined,
            onChanged: (value) => email = value,
            validator: (value) {
              final v = value;
              if (v == null || v.trim().isEmpty)return 'Se requiere un email de usuario.';
              final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegExp.hasMatch(v))return 'Formato del correo incorrecto.';
              return null;
            }
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Contraseña',
            prefixIcon: Icons.password_rounded,
            obscure: true,
            onChanged: (value) => password = value,
            validator: (value) {
              final v = value;
              if (v == null || v.trim().isEmpty)return 'Se requiere una contraseña.';
              if (v.trim().length < 6)return 'La contraseña debe tener almenos 6 caracteres.';
              return null;
            }
          ),

          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              final isValid =_formKey.currentState!.validate(); // 🔍 Valida todos los campos
              if (!isValid) return; // ⛔ Si algo está mal, no sigue

              debugPrint('$username, $email, $password',); // ✅ Si todo bien, imprime los datos
            },
            icon: const Icon(Icons.save),
            label: const Text('Crear usuario'),
          ),

        ],
      ),
    );
  }
}
