import 'package:flutter_app_test/element.dart';
import 'package:flutter_app_test/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Calculate1>(
        create: (_) => Calculate1(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        )
    );
  }
}
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Textfield(),
          ButtonsField(),
          RigidTextField(),
        ],
      ),
    );
  }
}

class Textfield extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Calculate1>(builder: (context, model, child) {
      double screenSizeWidth = MediaQuery.of(context).size.width;
      return Container(
        width: screenSizeWidth,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("${model.result}"),
          ],
        ),
      );
    });
  }
}

class ButtonsField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenSizeWidth = MediaQuery.of(context).size.width;
    return Container(
      width: 500,
      height: 500,
      child: GridView.count(
          crossAxisCount: 3,
          children: numbers.map((e) => GridTile(
            child: Button(num: e["num"]!),
          ),
          ).toList()
      ),
    );
  }
}

class Button extends StatelessWidget {
  Button({Key? key, required this.num}) : super(key: key);
  final String num;

  @override
  Widget build(BuildContext context) {
    return Consumer<Calculate1>(builder: (context, model, child) {
      return GestureDetector(
        onTap: () {
          model.calculation(num);
        },
        child: Container(
          color: model.check == false ? Colors.white70 : Colors.lightBlue,
          child: Center(
            child: Text(
                num
            ),
          ),
        ),
      );
    });
  }
}

class RigidTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Calculate1>(builder: (context, model, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("${model.rigidResult}"),
        ],
      );
    });
  }
}
