import 'package:flutter/material.dart';

class CounterFunctionScreen extends StatefulWidget {
  const CounterFunctionScreen({super.key});

  @override
  State<CounterFunctionScreen> createState() => _CounterFunctionScreenState();
}

class _CounterFunctionScreenState extends State<CounterFunctionScreen> {
  int clickCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Counter Functions'),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.refresh_rounded),
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clickCounter',
                style: const TextStyle(
                    fontSize: 160, fontWeight: FontWeight.w100)),
            Text(
              (clickCounter == 1) ? 'click' : 'Clicks',
                style: const TextStyle(fontSize: 25)),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.plus_one_outlined,
            color: Colors.blueAccent,
            onPressed: () {
              setState(() {
                clickCounter++;
              });
            },
          ),
          const SizedBox(height: 15),
          CustomButton(
            icon: Icons.exposure_minus_1_outlined,
            color: Colors.orangeAccent,
            onPressed: () {
              setState(() {
                (clickCounter <= 0) ? 0 : clickCounter--;
              });
            },
          ),
          const SizedBox(height: 15),
          CustomButton(
            icon: Icons.refresh_outlined,
            color: Colors.redAccent,
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback? onPressed;
  const CustomButton({
    super.key,
    required this.icon,
    required this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      enableFeedback: true,
      // backgroundColor: color,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
