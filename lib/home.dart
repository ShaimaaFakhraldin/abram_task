import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'card_widget.dart';
import 'model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    fetchAlbum();
    super.initState();
  }
  Autogenerated Aut = Autogenerated();
  bool loaded = false;
  fetchAlbum() async {
    loaded = true;
    setState(() {});
    print("ddddddddddddddddddddddddd");
    var data = await http
        .get(Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&apiKey=ec29b0dd18f04052a600f2761ec7542f'));
    print(data.body);

    Aut =Autogenerated.fromJson(jsonDecode(data.body));
    loaded = false;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Amit Exam"),backgroundColor: Colors.black, elevation: 0,centerTitle: true,),
        backgroundColor: Colors.black,
        drawer: SafeArea(child: Drawer(child: Text("Setting"),)),
        body:
        loaded==false?

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount:5, //Aut.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return CardWidgets(
                  name: Aut.data![index].name,
                  desc:Aut.data![index].creationAt,
                  time:Aut.data![index].password,
                  url:Aut.data![index].avatar,
                );
              }
          ),
        ):Center(child: CircularProgressIndicator())

    );
  }
}