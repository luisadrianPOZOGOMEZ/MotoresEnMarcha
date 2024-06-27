import 'package:flutter/material.dart';

//cascaron para poder copiar y pegar:
class CursosPage extends StatefulWidget {
  const CursosPage({super.key});

  @override
  State<CursosPage> createState() => _CursosPageState();
}

class _CursosPageState extends State<CursosPage> {
  int currentPageIndex = 0;

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
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Color.fromARGB(0, 78, 66, 212),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home),
            label: "Ejercicios",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home),
            label: "Juegos",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home),
            label: "Cursos",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home),
            label: "Logros",
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Cursos',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              child: SizedBox(
                height: 200,
                child: ListTile(
                  leading: Image.network('https://www.lateralidadypsicologiallorens.com/wp-content/uploads/2024/01/observacion-dibujo-ninos-lateralidad.jpg'),
                  title: const Text('Title recurse'),
                  subtitle: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor, justo id tincidunt lacinia.',
                ),
              ),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: SizedBox(
                height: 200,
                child: ListTile(
                  leading: Image.network('https://www.lateralidadypsicologiallorens.com/wp-content/uploads/2024/01/observacion-dibujo-ninos-lateralidad.jpg'),
                  title: const Text('Title recurse'),
                  subtitle: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor, justo id tincidunt lacinia.',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
              Card(
              child: SizedBox(
                height: 200,
                child: ListTile(
                  leading: Image.network('https://www.lateralidadypsicologiallorens.com/wp-content/uploads/2024/01/observacion-dibujo-ninos-lateralidad.jpg'),
                  title: const Text('Title recurse'),
                  subtitle: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor, justo id tincidunt lacinia.',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
