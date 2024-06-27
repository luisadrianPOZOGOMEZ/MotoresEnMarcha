import 'package:flutter/material.dart';

//cascaron para poder copiar y pegar:
class JuegoPage extends StatefulWidget {
  const JuegoPage({super.key});

  @override
  State<JuegoPage> createState() => _JuegoPageState();
}

class _JuegoPageState extends State<JuegoPage> {
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
                'Nombre del Juego',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
Card(
  child: SizedBox(
    height: 400,
    child: Column(
      children: [
        ListTile(
          title: const Text('Title recurse'),
          subtitle: const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor, justo id tincidunt lacinia. Lorem ipsum dolor sit amet consectetur. Viverra ut nibh in in. Amet semper quam purus lectus vulputate a placerat dolor. Bibendum pulvinar vulputate eu quis arcu ipsum. Sed vel enim arcu consectetur purus luctus. Tincidunt scelerisque malesuada ornare fames. Lorem ipsum dolor sit amet consectetur. Viverra ut nibh in in. Amet semper quam purus lectus vulputate a placerat dolor. Bibendum pulvinar vulputate eu quis arcu ipsum. Sed vel enim arcu consectetur purus luctus. Tincidunt scelerisque malesuada ornare fames.',
          ),
        ),
        Spacer(), // Spacer to push the button to the bottom
        Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Continuar'),
          ),
        ),
        SizedBox(height: 10), // Space between buttons
        /* ElevatedButton(
          onPressed: () {},
          child: const Text('Button at Bottom'),
        ),
        SizedBox(height: 10), */ // Padding at the bottom
      ],
    ),
  ),
),

          ],
        ),
      ),
    );
  }
}
