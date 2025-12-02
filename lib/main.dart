//GRUPO 6
//INGENIERIA EN SISTEMAS INSTELIGENTES

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ---------------------------------------------------
// MOCK DATA (Datos Ficticios) - Adaptado a Academia de Fútbol
// ---------------------------------------------------

// Modelo para una Categoría de Entrenamiento de Fútbol (Servicio)
class SoccerCategory {
  final String name; // Ej: Mini Fútbol
  final String ageRange; // Ej: 5 - 7 años
  final double price; // Precio Mensual
  final String description;

  SoccerCategory({
    required this.name,
    required this.ageRange,
    required this.price,
    required this.description,
  });
}

// Lista de categorías de entrenamiento (Requerimiento de Clasificación por edades)
final List<SoccerCategory> mockSoccerCategories = [
  SoccerCategory(
    name: 'Mini Fútbol',
    ageRange: '5 - 7 años',
    price: 50.00,
    description:
        'Introducción lúdica al fútbol, desarrollo de habilidades motoras y coordinación básica. Ideal para los más pequeños.',
  ),
  SoccerCategory(
    name: 'Infantil A',
    ageRange: '8 - 9 años',
    price: 60.00,
    description:
        'Foco en fundamentos técnicos: pase, control orientado y regate. Se introducen posiciones básicas.',
  ),
  SoccerCategory(
    name: 'Infantil B',
    ageRange: '10 - 11 años',
    price: 70.00,
    description:
        'Perfeccionamiento de la técnica individual, entrenamiento de velocidad y tácticas básicas de equipo (transiciones).',
  ),
  SoccerCategory(
    name: 'Juvenil A',
    ageRange: '12 - 13 años',
    price: 80.00,
    description:
        'Énfasis en la comprensión táctica, posicionamiento en el campo, y desarrollo físico específico para la edad.',
  ),
  SoccerCategory(
    name: 'Juvenil B',
    ageRange: '14 - 15 años',
    price: 90.00,
    description:
        'Preparación para el fútbol de alta competencia, estrategia avanzada, análisis de juego y acondicionamiento avanzado.',
  ),
  SoccerCategory(
    name: 'Superior',
    ageRange: '16 - 18 años',
    price: 100.00,
    description:
        'Entrenamiento de élite, desarrollo de roles específicos, mentalidad competitiva y preparación para pruebas en clubes profesionales.',
  ),
];

// Categorías amplias para la TabBar
final List<String> mainCategories = ['Inicial', 'Intermedio', 'Avanzado'];

// Lista para simular usuarios registrados (Email y Contraseña).
// Almacena un mapa de {email: password}.
final Map<String, String> mockRegisteredUsers = {
  'test@example.com': 'password123', // Usuario de prueba inicial
};

// ---------------------------------------------------
// 1. App Principal y Configuración de Rutas
// ---------------------------------------------------

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Academia de Fútbol - Mi Club', // Título actualizado
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple, useMaterial3: true),
      initialRoute: '/login', // Inicia con la pantalla de Login
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}

// ---------------------------------------------------
// 2. Pantalla de Inicio de Sesión (Se mantiene)
// ---------------------------------------------------

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      // Simulación de lógica de inicio de sesión: verifica si las credenciales coinciden
      if (mockRegisteredUsers.containsKey(email) &&
          mockRegisteredUsers[email] == password) {
        // Credenciales correctas
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Credenciales incorrectas o usuario no existe
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Error de inicio de sesión: Correo o contraseña incorrectos.',
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de Sesión - Academia'), // Título actualizado
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Icon(
                  Icons.sports_soccer, // Ícono actualizado a fútbol
                  size: 80,
                  color: Colors.deepPurple,
                ),
                const SizedBox(height: 40),

                // Campo de Email
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Correo Electrónico',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese su correo';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Campo de Contraseña
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese su contraseña';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                // Botón de Inicio de Sesión
                ElevatedButton(
                  onPressed: _handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('INGRESAR', style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(height: 20),

                // Opción para Registrar Nuevo Cliente
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    '¿Aún no inscribes a tu hijo? Regístrate aquí.',
                  ), // Texto actualizado
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------
// 3. Formulario de Registro de Clientes (Se mantiene)
// ---------------------------------------------------

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controladores para los campos de datos personales
  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _ciudadController = TextEditingController();

  // Controladores para los campos de autenticación (NUEVOS)
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitRegistration() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      // 1. Verificar si el correo ya está registrado (simulación)
      if (mockRegisteredUsers.containsKey(email)) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error de Registro'),
            content: const Text(
              'El correo electrónico ya se encuentra registrado.',
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Aceptar'),
              ),
            ],
          ),
        );
        return;
      }

      // 2. Simulación de guardar los datos del nuevo cliente
      // Guardar credenciales para la simulación de login
      mockRegisteredUsers[email] = password;

      // 3. Mostrar confirmación de registro
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Inscripción Exitosa'), // Título actualizado
          content: Text(
            'El representante ${_nombreController.text} ha sido registrado. Ahora puede seleccionar la categoría para su niño.',
          ), // Mensaje actualizado
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el AlertDialog
                Navigator.of(context).pop(); // Regresa a la pantalla de Login
              },
              child: const Text('Aceptar'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inscripción de Representante'), // Título actualizado
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Registre sus datos como representante.', // Texto actualizado
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 20),

              // Campo: Cédula
              _buildTextField(
                _cedulaController,
                'Cédula / Identificación',
                Icons.badge,
                TextInputType.number,
              ),
              const SizedBox(height: 15),

              // Campo: Nombre completo
              _buildTextField(
                _nombreController,
                'Nombre Completo del Representante',
                Icons.person,
                TextInputType.text,
              ), // Etiqueta actualizada
              const SizedBox(height: 15),

              // Campo: Correo Electrónico
              _buildTextField(
                _emailController,
                'Correo Electrónico',
                Icons.email,
                TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),

              // Campo: Contraseña
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // Campo: Dirección
              _buildTextField(
                _direccionController,
                'Dirección de Residencia',
                Icons.location_on,
                TextInputType.streetAddress,
              ), // Etiqueta actualizada
              const SizedBox(height: 15),

              // Campo: Teléfono
              _buildTextField(
                _telefonoController,
                'Teléfono de Contacto',
                Icons.phone,
                TextInputType.phone,
              ), // Etiqueta actualizada
              const SizedBox(height: 15),

              // Campo: Ciudad
              _buildTextField(
                _ciudadController,
                'Ciudad',
                Icons.location_city,
                TextInputType.text,
              ),
              const SizedBox(height: 30),

              // Botón de Registro
              ElevatedButton(
                onPressed: _submitRegistration,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'FINALIZAR INSCRIPCIÓN',
                  style: TextStyle(fontSize: 18),
                ), // Texto actualizado
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget auxiliar para crear campos de texto con validación
  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon,
    TextInputType keyboardType,
  ) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        prefixIcon: Icon(icon),
      ),
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Este campo es obligatorio';
        }
        return null;
      },
    );
  }
}

// ---------------------------------------------------
// 4. Pantalla Principal con Navegación (HomePage) - Títulos actualizados
// ---------------------------------------------------

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const ServiceListScreen(), // Renombrado
    const CategoryTabScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // La AppBar es dinámica según la pantalla seleccionada
      appBar: AppBar(
        title: Text(
          _selectedIndex == 0
              ? 'Clasificación y Servicios'
              : // Título actualizado
                _selectedIndex == 1
              ? 'Programas por Categoría'
              : 'Mi Perfil de Representante',
        ), // Títulos actualizados
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      // Navegación inferior
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Servicios', // Etiqueta actualizada
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category), // Ícono actualizado
            label: 'Categorías',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}

// ---------------------------------------------------
// 5. Pantalla de Lista de Servicios (ListView) - Implementa "Ver detalles" y "Reservar cupo"
// ---------------------------------------------------

class ServiceListScreen extends StatelessWidget {
  const ServiceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView.builder(
        itemCount: mockSoccerCategories.length,
        itemBuilder: (context, index) {
          final service = mockSoccerCategories[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        service.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.deepPurple,
                        ),
                      ),
                      Text(
                        '\$${service.price.toStringAsFixed(2)}/Mes',
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Rango de Edad: ${service.ageRange}',
                    style: const TextStyle(color: Colors.black54),
                  ),
                  const Divider(height: 20),
                  Text(
                    'Descripción del Programa: ${service.description}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  // Botones requeridos: Ver detalles y Reservar cupo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          // Simulación de mostrar un modal de detalles
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(service.name),
                              content: Text(
                                'Detalles del programa:\n\nEdad: ${service.ageRange}\nCosto: \$${service.price.toStringAsFixed(2)}/mes\n\n${service.description}',
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('Cerrar'),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: const Icon(Icons.info_outline, size: 18),
                        label: const Text('Ver detalles'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Proceso de Reserva iniciado para la categoría ${service.name}.',
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.bookmark_add,
                          size: 18,
                        ), // Ícono de reservar
                        label: const Text('Reservar cupo'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ---------------------------------------------------
// 6. Pantalla de Categorías con TabBar (Agrupada por Nivel)
// ---------------------------------------------------

class CategoryTabScreen extends StatelessWidget {
  const CategoryTabScreen({super.key});

  // Función auxiliar para filtrar servicios por nivel amplio
  List<SoccerCategory> _filterServices(String category) {
    if (category == 'Inicial') {
      return mockSoccerCategories
          .where((c) => c.name == 'Mini Fútbol')
          .toList();
    } else if (category == 'Intermedio') {
      return mockSoccerCategories
          .where((c) => c.name == 'Infantil A' || c.name == 'Infantil B')
          .toList();
    } else if (category == 'Avanzado') {
      return mockSoccerCategories
          .where(
            (c) =>
                c.name == 'Juvenil A' ||
                c.name == 'Juvenil B' ||
                c.name == 'Superior',
          )
          .toList();
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    // Usamos DefaultTabController para gestionar el estado de las pestañas
    return DefaultTabController(
      length: mainCategories.length,
      child: Column(
        children: <Widget>[
          // TabBar para seleccionar el nivel (Inicial, Intermedio, Avanzado)
          Container(
            color: Colors.white,
            child: TabBar(
              isScrollable: true,
              indicatorColor: Colors.deepPurple,
              labelColor: Colors.deepPurple,
              unselectedLabelColor: Colors.grey,
              tabs: mainCategories
                  .map((category) => Tab(text: category))
                  .toList(),
            ),
          ),

          // TabBarView muestra las categorías de edad dentro de ese nivel
          Expanded(
            child: TabBarView(
              children: mainCategories.map((category) {
                final filteredServices = _filterServices(category);

                if (filteredServices.isEmpty) {
                  return Center(
                    child: Text(
                      'No hay programas en la categoría "$category".',
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: filteredServices.length,
                  itemBuilder: (context, index) {
                    final service = filteredServices[index];
                    return ListTile(
                      leading: const Icon(
                        Icons.sports_football,
                        color: Colors.deepPurple,
                      ),
                      title: Text(
                        service.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Edad: ${service.ageRange} | Precio: \$${service.price.toStringAsFixed(2)}/mes',
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Ver más información de ${service.name}.',
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------
// 7. Pantalla de Perfil (Placeholder) - Texto actualizado
// ---------------------------------------------------

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.account_circle,
            size: 100,
            color: Colors.deepPurpleAccent,
          ),
          const SizedBox(height: 20),
          const Text(
            'Bienvenido Representante',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // CORRECCIÓN: textAlign se mueve del TextStyle al widget Text.
          const Text(
            'Aquí puede gestionar los datos de su niño y sus inscripciones a la Academia.',
            textAlign: TextAlign.center, // <-- FIX APLICADO
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () {
              // Simulación de cierre de sesión
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: const Icon(Icons.logout),
            label: const Text('Cerrar Sesión'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          ),
        ],
      ),
    );
  }
}
