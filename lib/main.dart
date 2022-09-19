import 'package:dice_app_mobx/dice_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Tap the Dice!!!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final diceCounter = DiceCounter();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        title: Text(
          widget.title,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                    child: TextButton(
                        key: const Key("dice_button"),
                        onPressed: (() => diceCounter.roll()),
                        child: Observer(
                          builder: ((context) {
                            return Image.asset(
                                'assets/Dice${diceCounter.left}.png');
                          }),
                        ))),
                Expanded(
                    child: TextButton(
                        onPressed: () => diceCounter.roll(),
                        child: Observer(
                          builder: ((context) {
                            return Image.asset(
                                ('assets/Dice${diceCounter.right}.png'));
                          }),
                        )))
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Observer(builder: ((context) {
              return Text(
                "Total ${diceCounter.total}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              );
            }))
          ],
        ),
      ),
    );
  }
}
