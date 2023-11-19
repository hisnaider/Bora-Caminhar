import 'package:bora_caminhar/screens/modals/audio_selection_modal.dart';
import 'package:bora_caminhar/screens/modals/how_meditation_works_modal.dart';
import 'package:bora_caminhar/components/primary_button.dart';
import 'package:bora_caminhar/constants/meditation_constants.dart';
import 'package:flutter/material.dart';

class MeditationWidget extends StatelessWidget {
  const MeditationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MeditationConstants.title["pt-br"]!,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 12,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _AudioSelector(),
              SizedBox(
                width: 10,
              ),
              _MeditationTime()
            ],
          ),
          TextButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return const HowMeditationWorksModal();
                  },
                );
              },
              child: Text(MeditationConstants.howItWorksTitle["pt-br"]!)),
          PrimaryButton(
            title: "Iniciar",
            centralizeTitle: true,
            textStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.background),
            padding: const EdgeInsets.all(10),
            onPressed: () {},
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
            MeditationConstants.selectAudio["pt-br"]!,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.surface),
            child: SizedBox(
              height: 35,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: playAndPause,
                    child: Icon(
                      isPlaying
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                      color: Theme.of(context).colorScheme.primary,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 7),
                  const Expanded(child: Text("teste")),
                  const SizedBox(width: 7),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return const AudioSelectionModal();
                        },
                      );
                    },
                    child: const Icon(
                      Icons.menu,
                      size: 18,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MeditationTime extends StatelessWidget {
  const _MeditationTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          MeditationConstants.time["pt-br"]!,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.surface),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 35,
                width: 35,
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 18,
                  physics: const FixedExtentScrollPhysics(),
                  diameterRatio: 1.25,
                  overAndUnderCenterOpacity: 0.25,
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 60,
                    builder: (context, index) => Text(
                      "${index + 1}",
                    ),
                  ),
                ),
              ),
              Text(
                "min",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
