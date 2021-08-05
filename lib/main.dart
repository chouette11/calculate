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
        title: Text("計算"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          ResultField(),
          ButtonsField(),
        ],
      ),
    );
  }
}

class ResultField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Calculate1>(builder: (context, model, child) {
      double screenSizeWidth = MediaQuery.of(context).size.width;
      return Container(
        margin: EdgeInsets.only(right: 5),
        width: screenSizeWidth,
        height: 120,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${model.operator}",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${model.result}",
                  style:TextStyle(
                    fontSize: 60,
                  ),
                ),
              ],
            ),
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
      width: screenSizeWidth,
      height: screenSizeWidth,
      child: GridView.count(
          crossAxisCount: 4,
          children: ["7","8","9","÷","4","5","6","×","1","2","3","-","0","=","C","+",]
              .map((e) => GridTile(
            child: Button(num: e),
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
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black54,width: 1)
          ),
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
