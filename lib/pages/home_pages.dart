import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:motoresenmarcha/pages/login_pages.dart';

//cascaron para poder copiar y pegar:
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
          switch (index) {
            case 0:
              break;
            case 1:
              Navigator.pushNamed(context, '/juegos');
              break;
            case 2:
              Navigator.pushNamed(context, '/');
              break;
            case 3:
              Navigator.pushNamed(context, '/cursos');
              break;
            case 4:
              Navigator.pushNamed(context, '/logros');
              break;
          }
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
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Card(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 200,
                    width: 1000,
                    child: SvgPicture.asset(
                      'lib/assets/alien.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 200,
                    alignment: Alignment.center,
                     child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          '¡Bienvenidos, Pequeños Exploradores!',
                          style: TextStyle(
                            color: Color(0xFFEAEAEA),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 3.0,
                                color: Colors.black,
                                offset: Offset(1.0, 1.0),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Vamos a aprender y crecer juntos, superaremos desafíos y celebraremos cada logro.',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Recursos de interés',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Image.network('https://www.lateralidadypsicologiallorens.com/wp-content/uploads/2024/01/observacion-dibujo-ninos-lateralidad.jpg'),
                title: const Text('Title recurse'),
                subtitle: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor, justo id tincidunt lacinia.',
                ),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: Image.network('https://www.lateralidadypsicologiallorens.com/wp-content/uploads/2024/01/observacion-dibujo-ninos-lateralidad.jpg'),
                title: const Text('Title recurse'),
                subtitle: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor, justo id tincidunt lacinia.',
                ),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: Image.network('https://www.lateralidadypsicologiallorens.com/wp-content/uploads/2024/01/observacion-dibujo-ninos-lateralidad.jpg'),
                title: const Text('Title recurse'),
                subtitle: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor, justo id tincidunt lacinia.',
                ),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: Image.network('https://www.lateralidadypsicologiallorens.com/wp-content/uploads/2024/01/observacion-dibujo-ninos-lateralidad.jpg'),
                title: const Text('Title recurse'),
                subtitle: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor, justo id tincidunt lacinia.',
                ),
              ),
            ),
            const SizedBox(height: 8,),
            Card(
              child: ListTile(
                leading: Image.network('https://www.lateralidadypsicologiallorens.com/wp-content/uploads/2024/01/observacion-dibujo-ninos-lateralidad.jpg'),
                title: const Text('Title recurse'),
                subtitle: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor, justo id tincidunt lacinia.',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
