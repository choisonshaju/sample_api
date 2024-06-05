// import 'package:flutter/material.dart';
// import 'package:http/http.dart';

// import 'package:sample_api/controller.dart';
// import 'package:sample_api/datamodel.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<Post>? posts;
//   var isLoaded = false;
//   @override
//   void initState() {
//     super.initState();
//     getdata();
//   }

//   getdata() async {
//     //Api().fetchdata();
//     posts = await Api().fetchdata();
//     setState(() {
//       isLoaded = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: posts?.length,
//         itemBuilder: (context, index) {
//           return Container(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   Text(
//                     maxLines: 2,
//                     posts![index].title.toString(),
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//                   ),
//                   Text(
//                     maxLines: 10,
//                     posts![index].body.toString(),
//                     style:
//                         TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:sample_api/controller.dart';
import 'package:sample_api/datamodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Api controller = Api();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  getdata() async {
    await controller.fetchdata();
    setState(() {});
    // Api().fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: controller.apiarticles?.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.apiarticles?[index].title ?? "",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Text(
                      controller.apiarticles?[index].author ?? "",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      controller.apiarticles?[index].source?.name ?? "",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      controller.apiarticles?[index].description ?? "",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    
                    Center(
                      child: Container(
                        width: 300,
                        height: 400,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  controller.apiarticles?[index].urlToImage ??
                                      "")),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
