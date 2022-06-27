import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ArCoreController? arCoreController;
    _addSphere(ArCoreController _arCoreController) {
      final material = ArCoreMaterial(color: Colors.deepOrange);
      final sphere = ArCoreSphere(materials: [material], radius: 0.2);
      final node = ArCoreNode(
        shape: sphere,
        position: vector.Vector3(0, 0, -1),
      );
      _arCoreController.addArCoreNode(node);
    }


    _onArCoreCreated(ArCoreController _arCoreController) {
      arCoreController = _arCoreController;
       _addSphere(arCoreController!);
    }
 @override
 void dispose(){
      arCoreController!.dispose();
      super.dispose();

  }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreCreated,
      ),
    );
  }
}
