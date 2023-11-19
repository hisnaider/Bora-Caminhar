import 'package:flutter/material.dart';

class ModalContainer extends StatelessWidget {
  const ModalContainer(
      {super.key, required this.children, required this.title});
  final List<Widget> children;
  final String title;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 50,
          height: 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          constraints: BoxConstraints(maxHeight: screenHeight - 100),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            color: Theme.of(context).colorScheme.background,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              Divider(
                color: Colors.white.withOpacity(0.1),
                height: 25,
                thickness: 1,
              ),
              ...children,
            ],
          ),
        )
      ],
    );
  }
}
