import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'lista_evento.dart';
import 'event_provider.dart';
import 'thema.dart';
import 'settings.dart';
import 'perfil.dart';

void main() {
  runApp(AgendaEventosApp());
}

class AgendaEventosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EventProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Agenda de Eventos',
            themeMode: themeProvider.themeMode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            home: EventListScreen(),
            routes: {
              '/settings': (context) => SettingsScreen(),
              '/profile': (context) => ProfileScreen(),
            },
          );
        },
      ),
    );
  }
}
