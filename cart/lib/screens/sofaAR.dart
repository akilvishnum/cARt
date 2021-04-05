import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  UnityWidgetController unityWidgetController;

  void _incrementCounter() {
    print("////////////////////////////////////////////");
    // unityWidgetController.postMessage('GameObject', 'openScene', 'Scene2');
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => MyHomePage(title: 'Flutter Demo Home Page')));
  }

  void onUnityCreated(UnityWidgetController controller) {
    unityWidgetController = controller;
  }

  void onUnitySceneLoaded(SceneLoaded sceneInfo) {
    print('Received scene loaded from unity: ${sceneInfo.name}');
    print(
        'Received scene loaded from unity buildIndex: ${sceneInfo.buildIndex}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UnityWidget(
        onUnityCreated: onUnityCreated,
        onUnitySceneLoaded: onUnitySceneLoaded,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
