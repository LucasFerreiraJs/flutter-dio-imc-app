import 'package:calculo_imc/page/calculo_page.dart';
import 'package:calculo_imc/page/lista_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/calculo': (context) => TabBarApp(),
        '/lista': (context) => CalculoPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: TabBarApp(),
    );
  }
}

class TabBarApp extends StatefulWidget {
  const TabBarApp({super.key});
  @override
  State<TabBarApp> createState() => _TabBarAppState();
}

class _TabBarAppState extends State<TabBarApp> {
  int _currentIndex = 0;

  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.calculate),
      label: 'Calculo IMC',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.format_list_bulleted_outlined),
      label: 'Lista',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return CalculoPage();
      case 1:
        return ListaPage();
      default:
        return CalculoPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
