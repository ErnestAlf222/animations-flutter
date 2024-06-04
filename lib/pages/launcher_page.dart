import 'package:animations/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../config/theme/app_theme.dart';

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

    final appTheme = Provider.of<ThemeChanger>(context).themeNow;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) =>  Divider(color: appTheme.primaryColorLight),
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(
          pageRoutes[index].icon,
          color: appTheme.colorScheme.secondary,
        ),
        title: Text(pageRoutes[index].titulo),
        trailing:  Icon(Icons.chevron_right, color: appTheme.colorScheme.secondary),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => pageRoutes[index].page));
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
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.themeNow.colorScheme.secondary;

    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(30),
              width: double.infinity,
              height: 200,
              child:  CircleAvatar(
                backgroundColor: accentColor,
                child: const Text(
                  'EA',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          const Expanded(child: _ListaOpciones()),
          ListTile(
            leading:  Icon(
              Icons.account_box,
              color: accentColor
            ),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
              value: appTheme.darkTheme,
              activeColor: accentColor,
              onChanged: (value) => appTheme.darkTheme = value,
            ),
          ),
          SafeArea(
            bottom: true,
            top: false,
            left: false,
            right: false,
            child: ListTile(
              leading:  Icon(
                Icons.add_to_home_screen,
                color: accentColor,
              ),
              title: const Text('Custom Theme'),
              trailing: Switch.adaptive(
                value: appTheme.customTheme,
                activeColor: Colors.blue,
                onChanged: (value) => appTheme.customTheme = value,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
