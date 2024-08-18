import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String quote =
      'The Miracle Is Not That We Do This Work, But That We Are Happy To Do It.';
  String author = 'Mother Teresa';
  var url = Uri.parse('https://dummyjson.com/quotes/random');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Quotes"),
          ),
          backgroundColor: const Color.fromARGB(255, 142, 249, 249),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    quote,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        author,
                        style: const TextStyle(fontSize: 15),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {});

                        var response = await http.get(url);
                        // print('Response status: ${response.statusCode}');
                        var data = jsonDecode(response.body);
                        quote = (data['quote']);
                        author = (data['author']);
                        setState(() {});
                      },
                      child: const Text("Next Quote"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
