import 'package:flutter/material.dart';
import 'package:homey_pet/screens/home_screen.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: FullScreenImage());
  }
}

class FullScreenImage extends StatelessWidget {
  const FullScreenImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        //background full screen
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/introduction.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //tombol untuk menuju halaman home
        Positioned(
          bottom: 60,
          left: 50,
          right: 50,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            icon: const Icon(
              Icons.navigate_next,
              color: Colors.lightBlueAccent,
            ),
            label: const Text(
              'Get Started',
              style: TextStyle(color: Colors.lightBlueAccent),
            ),
          ),
        )
      ],
    );
  }
}
