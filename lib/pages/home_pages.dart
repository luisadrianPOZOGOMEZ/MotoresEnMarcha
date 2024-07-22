import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int currentPageIndex = 0;
  bool _isExpanded = true;
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _textScaleAnimation;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(begin: 0, end: 0.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _textScaleAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleAnimation() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    });
  }

  void _navigateToPage(String route) {
    if (isLoggedIn) {
      Navigator.pushNamed(context, route);
    } else {
      Navigator.pushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'lib/assets/motoresenmarcha.svg',
          fit: BoxFit.cover,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              color: Colors.black,
              size: 50.0,
            ),
            onPressed: () {
              _navigateToPage('/perfil');
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
              _navigateToPage('/check');
              break;
            case 1:
              _navigateToPage('/juegos');
              break;
            case 2:
              Navigator.pushNamed(context, '/');
              break;
            case 3:
              _navigateToPage('/cursos'); 
              break;
            case 4:
              _navigateToPage('/logros');
              break;
          }
        },
        indicatorColor: Color.fromARGB(0, 78, 66, 212),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.menu_book),
            icon: Icon(Icons.menu_book),
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
            selectedIcon: Icon(Icons.library_books),
            icon: Icon(Icons.library_books),
            label: "Cursos",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.emoji_events),
            icon: Icon(Icons.emoji_events),
            label: "Logros",
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            GestureDetector(
              onTap: _toggleAnimation,
              child: Card(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Stack(
                      children: <Widget>[
                        Transform.rotate(
                          angle: _rotationAnimation.value,
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            child: Image.asset(
                              'lib/assets/alien.gif',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Transform.scale(
                            scale: _textScaleAnimation.value,
                            child: Container(
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
                          ),
                        ),
                      ],
                    );
                  },
                ),
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
          ],
        ),
      ),
    );
  }
}
