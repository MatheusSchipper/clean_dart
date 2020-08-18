import 'package:clean_dart/modules/search/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var buttonWidth = screenSize.width > screenSize.height
        ? screenSize.width * 0.2
        : screenSize.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: buttonWidth,
                    child: RaisedButton(
                      onPressed: () {
                        Modular.to.pushNamed(githubRoute);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(FontAwesomeIcons.github),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Github Search"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: buttonWidth,
                    child: RaisedButton(
                      onPressed: () {
                        Modular.to.pushNamed(randomDogRoute);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(FontAwesomeIcons.dog),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Random Dog"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
