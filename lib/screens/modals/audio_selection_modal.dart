import 'package:bora_caminhar/components/modal_container.dart';
import 'package:bora_caminhar/constants/constant.dart';
import 'package:bora_caminhar/constants/meditation_constants.dart';
import 'package:flutter/material.dart';

class AudioSelectionModal extends StatefulWidget {
  const AudioSelectionModal({super.key});

  @override
  State<AudioSelectionModal> createState() => _AudioSelectionModalState();
}

class _AudioSelectionModalState extends State<AudioSelectionModal> {
  @override
  Widget build(BuildContext context) {
    String language = "pt-br";
    String audio = "value";
    return ModalContainer(
      title: MeditationConstants.selectAudio[language]!,
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: meditationAudioList.length,
              itemBuilder: (context, index) {
                return _AudioContainer(
                  name: meditationAudioList[index]["name"]!,
                  artist: meditationAudioList[index]["artist"]!,
                );
              }),
        ),
      ],
    );
  }
}

class _AudioContainer extends StatelessWidget {
  const _AudioContainer({super.key, required this.name, required this.artist});
  final String name;
  final String artist;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Row(
        children: [
          IconButton.filled(
            onPressed: () {},
            icon: Icon(
              Icons.play_arrow_rounded,
              size: 24,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  artist.toUpperCase(),
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
          ),
          Radio(
            value: "value",
            groupValue: "audio",
            onChanged: (value) {},
          )
        ],
      ),
    );
  }
}
