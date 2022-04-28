import 'package:flutter/material.dart';
import 'package:physical_auth/main.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Welcome to Physical Auth',
    home: WelcomePage(),
  ));
}
class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ipController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Physical Auth'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.all(10),
                child: Image.network(
                    "https://i.ibb.co/ynPmwsD/Physical-Auth-Logo.png")),
             Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: ipController,
                  decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                labelText: 'IP Address Shown on Screen',
              ),
            )),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(title: "PhysicalAuth")));
              },
              child: const Text('Connect to Device'),
            ),
          ],
        ),
      ),
    );
  }
}