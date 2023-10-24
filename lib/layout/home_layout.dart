import 'package:flutter/material.dart';
import 'package:news/shared/network/remote/api_manager.dart';

import '../screens/tab_controller.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = "Home";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          title: Text("News"),
          backgroundColor: Colors.green,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
              borderSide: BorderSide(color: Colors.transparent)),
        ),
        body: FutureBuilder(
          future: ApiManager.getSource(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.data?.status != "ok") {
              return Center(child: Text(snapshot.data!.message!));
            }
            var sources = snapshot.data?.sources ?? [];
            return TabControllerScreen(sources);
          },
        ),
      ),
    );
  }
}
