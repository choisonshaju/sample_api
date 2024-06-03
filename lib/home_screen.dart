import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:sample_api/controller.dart';
import 'package:sample_api/datamodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post>? posts;
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    //Api().fetchdata();
    posts = await Api().fetchdata();
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: posts?.length,
        itemBuilder: (context, index) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    maxLines: 2,
                    posts![index].title.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Text(
                    maxLines: 10,
                    posts![index].body.toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
