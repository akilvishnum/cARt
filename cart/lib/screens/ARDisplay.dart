import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class ARDisplay extends StatefulWidget {
  String scene;
  ARDisplay({scene});
  @override
  _ARDisplayState createState() => _ARDisplayState();
}

class _ARDisplayState extends State<ARDisplay> {
  int _counter = 0;
  UnityWidgetController unityWidgetController;
  String currentScene = "Sofa";
  void initState() {
    setState(() {
      currentScene = widget.scene;
    });
    print(
        "..................$currentScene ++ ${widget.scene}..................?");
  }

  void _incrementCounter() {
    // _counter++;
    // if (_counter % 2 != 0)
    //   unityWidgetController.postMessage('SceneChanger', 'openScene', 'Sofa');
    // else
    //   unityWidgetController.postMessage('SceneChanger', 'openScene', 'Scene2');
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => MyHomePage(title: 'Flutter Demo Home Page')));
  }

  void onUnityCreated(UnityWidgetController controller) {
    unityWidgetController = controller;

    unityWidgetController.postMessage('SceneChanger', 'openScene', 'Sofa');
  }

  void onUnitySceneLoaded(SceneLoaded sceneInfo) {
    print('Received scene loaded from unity: ${sceneInfo.name}');
    print(
        'Received scene loaded from unity buildIndex: ${sceneInfo.buildIndex}');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        unityWidgetController.postMessage(
            'SceneChanger', 'openScene', 'Scene2');
        Navigator.pop(context);
      },
      child: Scaffold(
          body: UnityWidget(
        onUnityCreated: onUnityCreated,
        onUnitySceneLoaded: onUnitySceneLoaded,
      )),
    );
  }
}
