import 'package:animations/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Diseños en Flutter'),
        ),
        drawer: const _MenuPrincipal(),
        body: const _ListaOpciones());
  }
}

// ? Lista de opciones
class _ListaOpciones extends StatelessWidget {
  
  const _ListaOpciones();

  @override
  Widget build(BuildContext context) {
    
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(color: Colors.blue),
      itemBuilder: (context, index) => ListTile(
        leading:  FaIcon(
          pageRoutes[index].icon,
          color: Colors.blue,
        ),
        title:  Text(pageRoutes[index].titulo),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.blue
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => pageRoutes[index].page));

        },
      ),
      itemCount: pageRoutes.length,
    );
  }
}

// ? Menú lateral
class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(30),
              width: double.infinity,
              height: 200,
              child: const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  'EA',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          const Expanded(child: _ListaOpciones()),
          ListTile(
            leading: const Icon(
              Icons.account_box,
              color: Colors.blue,
            ),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
              value: true,
              activeColor: Colors.blue,
              onChanged: (value) {},
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.add_to_home_screen,
              color: Colors.blue,
            ),
            title: const Text('Custom Theme'),
            trailing: Switch.adaptive(
              value: true,
              activeColor: Colors.blue,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
