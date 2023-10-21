import 'package:calculo_imc/page/calculo_page.dart';
import 'package:calculo_imc/page/lista_page.dart';
import 'package:calculo_imc/shared/repository/imc_repository.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await ImcRepository.load();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ImcRepository()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/calculo': (context) => CalculoPage(ctx: context),
        '/lista': (context) => ListaPage(ctx: context),
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
        return CalculoPage(ctx: context);
      case 1:
        return ListaPage(ctx: context);
      default:
        return CalculoPage(ctx: context);
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
