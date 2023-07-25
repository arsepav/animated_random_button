import 'package:animated_random_button/animated_random_button.dart';
import 'package:animated_random_button/coin_button.dart';
import 'package:animated_random_button/magic_sphere.dart';
import 'package:flutter/material.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class newCoins extends Coins {

  static const myFancyCoin = Coins(Coin('assets/FancyCoinHead.png','assets/FancyCoinTail.png'));

  newCoins(super.value);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final eurController = CoinController();
    final rubController = CoinController();
    final centController = CoinController();
    final fancyCoinController = CoinController();
    final colorController = RandomColorWheelController();
    final diceButtonController = DiceButtonController();
    final magicBallController = MagicBallController();
    return MaterialApp(
      title: 'Example for Random Widget Tools package',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Example for Random Widget Tools package'),
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              RandomColorWheel(
                controller: colorController,
                colors: const [
                  Colors.black,
                  Colors.amber,
                  Colors.black12,
                  Color(0xFF9D53CC),
                  Color(0xFF67508D),
                  Color(0xff141460),
                  Color.fromRGBO(10, 186, 181, 1),
                ],
                size: 100,
                onPressed: () {
                  print(colorController.color);
                  print("Wheel is spinning");
                },
                duration: const Duration(seconds: 1),
              ),
              const SizedBox(
                width: 30,
                height: 30,
              ),
              const SizedBox(
                height: 50,
              ),
              BouncingDiceButton(
                controller: diceButtonController,
                start: 1,
                end: 6,
                duration: const Duration(milliseconds: 2000),
                onPressed: () {
                  print(diceButtonController.value);
                  print("hello");
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CoinButton(radius: 100, coin: newCoins.myFancyCoin, coinController: fancyCoinController, onPressed: (){},),
                  const SizedBox(
                    width: 25,
                  ),
                  CoinButton(
                    onPressed: () {},
                    radius: 100,
                    coin: Coins.Euro,
                    duration: const Duration(seconds: 2),
                    coinController: eurController,
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  CoinButton(
                    onPressed: () {},
                    radius: 100,
                    coin: Coins.Ruble,
                    duration: const Duration(seconds: 2),
                    coinController: rubController,
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  CoinButton(
                    onPressed: () {},
                    radius: 100,
                    coin: Coins.Cent,
                    duration: const Duration(seconds: 2),
                    coinController: centController,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Magic8Ball(
                radius: 100,
                shakeDistance: 15,
                numberOfShakes: 10,
                durationOfShake: Duration(milliseconds: 100),
                answers: ["yes", "definetly yes"],
                controller: magicBallController,
                onPressed: (){print(magicBallController.answer);},
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
