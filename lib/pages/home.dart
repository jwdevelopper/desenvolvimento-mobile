import 'package:flutter/material.dart';
import 'package:my_app_teste/pages/categoria.dart';
import 'package:my_app_teste/pages/cliente.dart';
import 'package:my_app_teste/pages/dashboard.dart';
import 'package:my_app_teste/pages/produto.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DashboardWidget(),
    CategoriaWidget(),
    ProdutoWidget(),
    ClienteWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: IndexedStack(index: _selectedIndex, children: _widgetOptions),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors:  [
                    Colors.blueAccent, 
                    Colors.lightBlue, 
                    Colors.lightBlueAccent, 
                    Colors.blue,
                    Colors.blueGrey],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                  )
              ),
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/12345678?v=4"),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Usuário Exemplo",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Dashboard'),
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: const Text('Produto'),
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: const Text('Categoria'),
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
             ListTile(
              leading: Icon(Icons.person),
              title: const Text('Cliente'),
              onTap: () {
                setState(() {
                  _selectedIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
      
    );
  }
}
