import 'package:flutter/material.dart';
import 'package:invoice_up/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Future.delayed(const Duration(seconds: 2), () {
    //   Navigator.push(context,
    //       MaterialPageRoute(builder: ((context) => const HomeScreen())));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 140,
              child: Image(
                image: AssetImage('images/logoInvoiceUp.png'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Invoice",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(1.0, 2.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(132, 39, 39, 39),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Up',
                  style: TextStyle(
                    color: ColorsInvoiceUp.blue900,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    shadows: const <Shadow>[
                      Shadow(
                        offset: Offset(1.0, 2.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(132, 39, 39, 39),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
