import 'package:flutter/material.dart';
import 'package:news/shared/network/remote/api_manager.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: FutureBuilder(
        future: ApiManager.getSource(), builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        var sources = snapshot.data?.sources ?? [];
        return ListView.builder(itemBuilder: (context, index) {
          return Text(sources[index].name ?? "");
        }, itemCount: sources.length,);
      },),
    );
  }
}
