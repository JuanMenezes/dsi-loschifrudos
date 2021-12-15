// ignore_for_file: file_names, unused_import
import 'package:flutter/material.dart';
import 'package:los_chifrudos/dashboards_pages/escolas.dart';
import 'cadastro.dart';
import 'TelaEntrar.dart';

// ignore: use_key_in_widget_constructors
class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.jpg'))),
          ),
          ListTile(
            leading: const Icon(Icons.input),
            title: const Text('Entrar/Cadastro'),
            onTap: () => {Navigator.pushNamed(context, Entrar.id)},
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Editar para aparecer só qando estiver logado*'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text('Dashboards Situação Escolas'),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DashboardEscolas(
                            title: '',
                          )),
                );
              }),
        ],
      ),
    );
  }
}
