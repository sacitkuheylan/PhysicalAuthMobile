import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:physical_auth/token_list.dart';

Future<SecretKeyDetail> fetchKeyData(String address, String dataPointer) async {
  final response = await http.get(Uri.parse('http://' + address + ':5000/api/tokens?id=' + dataPointer));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return SecretKeyDetail.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load key');
  }
}

Future<SecretKeyDetail> sendSecretKey(
    String name, String secretKey, int digitCount) async {
  final http.Response response = await http.post(Uri.parse('http://192.168.2.75:5000/api/tokens'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'secretKey': secretKey,
      'name': name,
      'digitCount': digitCount.toString()
    }),
  );
  if (response.statusCode == 201) {
    return SecretKeyDetail.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Physical Auth',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Physical Auth', address: "192.168.1.44",),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.address}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String address;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}
class User {
  final String name;
  final String email;

  const User({
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
    );
  }
}

class SecretKeyDetail {
  final String name;
  final String secretKey;
  final int digitCount;

  const SecretKeyDetail({
    required this.name,
    required this.secretKey,
    required this.digitCount,
  });

  factory SecretKeyDetail.fromJson(Map<String, dynamic> json) {
    return SecretKeyDetail(
      name: json['name'],
      secretKey: json['secretKey'],
      digitCount: json['digitCount'],
    );
  }
}

class Device {
  final String devipAddress;

  const Device({required this.devipAddress});
}

void postKeyData() {

}

class _MyHomePageState extends State<MyHomePage> {
  late Future<User> newUser;
  late Future<SecretKeyDetail> keyDetail;

  @override
  void initState() {
    super.initState();
    keyDetail = fetchKeyData(widget.address, "3");
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final nameController = TextEditingController();
    final secretKeyController = TextEditingController();
    final digitCountController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.address),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.all(10),
                child: Image.network(
                    "https://i.ibb.co/ynPmwsD/Physical-Auth-Logo.png")),
            Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                child: TextField(
                  autocorrect: false,
                  controller: nameController,
                  decoration: const InputDecoration(hintText: "Name"),
                )),
            Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                child: TextField(
                  autocorrect: false,
                  controller: secretKeyController,
                  decoration: const InputDecoration(hintText: "Secret Key"),
                )),
            Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                child: TextField(
                  autocorrect: false,
                  controller: digitCountController,
                  decoration: const InputDecoration(hintText: "Digit Count"),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ElevatedButton.icon(
                icon: const Icon(
                Icons.add_a_photo,
                color: Colors.white,
                size: 30.0,),
                label: const Text('Add token via QR Code'),
            onPressed: () {
              print('Button Pressed');
            })),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                      size: 30.0,),
                    label: const Text('Show Token List'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TokenList()));
                    })),
            ElevatedButton.icon(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 30.0,),
              label: const Text("Add token"),
             onPressed: () async {
              final http.Response response = await http.post(Uri.parse('http://' + widget.address + ':5000/api/tokens'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(<String, String>{
                  'secretKey': secretKeyController.text,
                  'name': nameController.text,
                  'digitCount': digitCountController.text
                }),
              );
            },
            ),
            FutureBuilder<SecretKeyDetail>(
                future: keyDetail,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.name + "\n" + snapshot.data!.secretKey + "\n" + snapshot.data!.digitCount.toString());
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                })
          ],
        ),
      ),
    );
  }
}
