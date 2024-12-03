// ignore_for_file: unnecessary_new

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rn_flutter_sdk/provider/_api_list_provider_.dart';
import 'package:rn_flutter_sdk/screens/apiList.dart';
import 'package:rn_flutter_sdk/screens/apiTechy.dart';
import 'package:rn_flutter_sdk/models/_album_.dart';
import 'package:flutter/material.dart';
import 'package:rn_flutter_sdk/models/_hive_model_.dart';
import 'package:rn_flutter_sdk/screens/hiveLocalStorage.dart';
import 'package:hive_flutter/hive_flutter.dart';

// void main() {
//   runApp(MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(DataModelAdapter().typeId)) {
    Hive.registerAdapter(DataModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 30, 177, 35)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      case 2:
        page = FormsPage();
        break;
      case 3:
        page = ApiList();
        break;
      case 4:
        page = ApiTechy();
        break;
      case 5:
        page = HiverLocalStorage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => SystemNavigator.pop(animated: true),
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favoritos'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.assignment),
                    label: Text('Formulário'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.android),
                    label: Text('Ligação para API (Lista)'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.rocket_launch_rounded),
                    label: Text('Ligação para API (Texto)'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.checklist_rounded),
                    label: Text('Memória local storage comhive'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Flutter APP',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          SizedBox(height: 100),
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}

class ApiList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApiListProvider(),
      child: const MaterialApp(
        home: ApiListPage(),
      ),
    );
  }
}

class ApiTechy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const ApiTechyPage(),
    );
  }
}

class HiverLocalStorage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HiveLocalStoragePage(),
    );
  }
}

class FormsPage extends StatefulWidget {
  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String company = '';
  String date = '';
  String email = '';

  Future<dynamic> createAlbum(String title) async {
    final respo = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    final Album album = Album.fromJson(jsonDecode(respo.body));

    // ignore: use_build_context_synchronously
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          // ignore: prefer_const_constructors
          title: new Text("Enviado com sucesso!"),
          content: new Text(
              'Retorno da API.\n~ID: ${album.id}\n~Title: ${album.title}'),
        );
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      createAlbum("Forms by $name");

      print('Name: $name\nCompany: $company\nDate: $date\nEmail: $email');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forms Page')),
      body: Center(
        child: Card(
          color: Theme.of(context).colorScheme.primaryContainer,
          margin: EdgeInsets.all(16.0),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        company = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your company';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Company',
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        date = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a date';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Date',
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(pair.asLowerCase, style: style),
      ),
    );
  }
}
