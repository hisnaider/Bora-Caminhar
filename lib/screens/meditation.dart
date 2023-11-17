import 'package:flutter/material.dart';

class MeditationWidget extends StatelessWidget {
  const MeditationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Meditar",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 12,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_AudioSelector()],
          )
        ],
      ),
    );
  }
}

class _AudioSelector extends StatefulWidget {
  const _AudioSelector({super.key});

  @override
  State<_AudioSelector> createState() => __AudioSelectorState();
}

class __AudioSelectorState extends State<_AudioSelector> {
  bool isPlaying = false;

  void playAndPause() {
    if (isPlaying) {
      ///TODO: pause function
    } else {
      ///TODO: play function
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Áudio para meditar",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.surface),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: playAndPause,
                  child: Icon(
                    isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                    color: Theme.of(context).colorScheme.primary,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 7),
                const Expanded(child: Text("teste")),
                const SizedBox(width: 7),
                const Icon(
                  Icons.menu,
                  size: 18,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
