
import 'package:demo_connect_native_app/src/screen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomeView(),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Main Page'),
    //   ),
    //   body: Center( child: Column(
    //     children: [
    //       ElevatedButton(onPressed: (){
    //         Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    //       }, child: const Text("Go To HomeScreen")),

          // ElevatedButton(onPressed: (){
          //   openKotlinActivity();
          // }, child: const Text("Go to Kotlin Activity"))
      //   ],
      // ),
        // child: ElevatedButton(
        //   onPressed: (){
        //     Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        //   },
        //   child: const Text("click go to HomeScreen"),
        // ),
    //   ),
    // );
  }
}

class MyHomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomePageState();

}

class MyHomePageState extends State<MyHomeView>{

  String _message = 'Unknown message';
  static const platform = MethodChannel('com.example.demo_connect_native_app/openKotlin');

  Future<void> _getMessage() async {
    String messageFromNativeCode ;
    try{
      messageFromNativeCode = await platform.invokeMethod('getMessageFromNativeCode');
    }on PlatformException catch (e){
      messageFromNativeCode = 'Failed to get message : ${e.message}';
    }

    setState(() {
      _message = messageFromNativeCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: Center( child: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
          }, child: const Text("Go To HomeScreen")),

          ElevatedButton(onPressed: _getMessage, child: const Text("Go to Kotlin Activity"))
        ],
      ),
        // child: ElevatedButton(
        //   onPressed: (){
        //     Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        //   },
        //   child: const Text("click go to HomeScreen"),
        // ),
      ),
    );
  }
}