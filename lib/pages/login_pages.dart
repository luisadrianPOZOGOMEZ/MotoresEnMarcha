import 'package:flutter/material.dart';

//cascaron para poder copiar y pegar:
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final _formKey = GlobalKey<FormState>();

  //int currentPageIndex = 0;

  void _submitForm() {
        //if (_formKey.currentState!.validate()) {
          Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false);
     // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Procesando datos')));
    //}
  }

  void _submitRegister() {
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    //final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Motores en Marcha'),
      ),
      body: Padding (
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Correo',
                  ),
                  /* validator: (value) {
                    if (value == null || value.isEmpty) {
                      return  'ingresa un correo';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'ingrese un correo valido';
                    }
                    return null;
                  }, */
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'contraseña',
                  ),
                  obscureText: true,
                  /* validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ingrese su contraseña';
                    }
                    return null;
                  }, */
                ),
                Row(
                  children: [
                    Text('No tienes cuenta'),
                    TextButton(
                      onPressed: _submitRegister,
                      child: Text('registrate')),
                  ],
                  //aca va a ir para el registro
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm, 
                  child: Text('iniciar sesión'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
