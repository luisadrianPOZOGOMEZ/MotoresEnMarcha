import 'package:flutter/material.dart';

//cascaron para poder copiar y pegar:
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  void _submitForm() {
    Navigator.popAndPushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    //final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Motores en Marcha'),
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.account_circle,
                color: Colors.black,
                size: 50.0,),
              onPressed: () {
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card (
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nombre', 
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Apellidos',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Correo',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm, 
                  child: Text('Registrarse'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
