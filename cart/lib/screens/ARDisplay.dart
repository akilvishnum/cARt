import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class ARDisplay extends StatefulWidget {
  String scene;
  ARDisplay({this.scene});
  @override
  _ARDisplayState createState() => _ARDisplayState();
}

class _ARDisplayState extends State<ARDisplay> {
  UnityWidgetController unityWidgetController;
  String currentScene = "Sofa";
  void initState() {
    //super.initState();
    setState(() {
      currentScene = widget.scene;
    });
  }

  void onUnityCreated(UnityWidgetController controller) {
    unityWidgetController = controller;

    unityWidgetController.postMessage('SceneChanger', 'openScene', 'laptop');
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
            'SceneChanger', 'openScene', 'Loading');
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
