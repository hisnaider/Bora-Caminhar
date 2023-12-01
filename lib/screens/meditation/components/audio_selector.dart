import 'package:bora_caminhar/screens/meditation/bloc/meditation_bloc.dart';
import 'package:bora_caminhar/screens/meditation/contants.dart';
import 'package:bora_caminhar/screens/meditation/views/audio_selection_modal.dart';
import 'package:flutter/material.dart';

class AudioSelector extends StatelessWidget {
  const AudioSelector({super.key, required this.onTap, required this.name});
  final String? name;
  final VoidCallback onTap;

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
                    onTap: onTap,
                    child: const Icon(
                      Icons.menu,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 7),
                  Expanded(
                    child: Opacity(
                      opacity: name != null ? 1 : 0.25,
                      child: Text(
                        name ?? "Nenhum audio selecionado",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
