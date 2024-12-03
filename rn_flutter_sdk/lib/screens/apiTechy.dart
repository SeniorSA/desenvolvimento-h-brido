import 'package:flutter/material.dart';
import 'package:rn_flutter_sdk/models/_api_techy_model_.dart';
import 'package:rn_flutter_sdk/services/_api_techy_services_.dart';

class ApiTechyPage extends StatefulWidget {
  const ApiTechyPage({super.key});

  @override
  State<ApiTechyPage> createState() => _ApiTechyPageState();
}

class _ApiTechyPageState extends State<ApiTechyPage> {
  String textStarted = "O texto aparecerá aqui!";
  TechyText? data;

  void handleGetRandomUser() async {
    final response = await getRandomUser();

    setState(() => data = response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.94),
      appBar: AppBar(
        title: const Text("Chamada de API"),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(100),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Card(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.green,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: data != null
                          ? ListTile(
                              title: const Text('Mensagem da API:'),
                              subtitle: Text(data!.message),
                            )
                          : ListTile(
                              title: const Text('Mensagem da API:'),
                              subtitle: Text(textStarted),
                            ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => handleGetRandomUser(),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                shape: const StadiumBorder(),
              ),
              child: const Text(
                "Chamar API",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
