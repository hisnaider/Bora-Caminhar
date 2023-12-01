import 'package:bora_caminhar/components/primary_button.dart';
import 'package:bora_caminhar/screens/meditation/bloc/meditation_State.dart';
import 'package:bora_caminhar/screens/meditation/bloc/meditation_bloc.dart';
import 'package:bora_caminhar/screens/meditation/bloc/meditation_event.dart';
import 'package:bora_caminhar/screens/meditation/components/audio_selector.dart';
import 'package:bora_caminhar/screens/meditation/components/time_selector.dart';
import 'package:bora_caminhar/screens/meditation/contants.dart';
import 'package:bora_caminhar/screens/meditation/functions/audio_functions.dart';
import 'package:bora_caminhar/screens/meditation/views/audio_selection_modal.dart';
import 'package:bora_caminhar/screens/meditation/views/how_meditation_works_modal.dart';
import 'package:bora_caminhar/screens/meditation_start/meditation_start_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MeditationBody extends StatefulWidget {
  const MeditationBody({super.key});

  @override
  State<MeditationBody> createState() => _MeditationBodyState();
}

class _MeditationBodyState extends State<MeditationBody> {
  MeditationBloc _bloc = MeditationBloc();
  @override
  void initState() {
    // TODO: implement initState
    _bloc.add(GetAudios(audioModels: getAudiofiles()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          MeditationConstants.title["pt-br"]!,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocSelector<MeditationBloc, MeditationState, int?>(
              selector: (state) => state.audioSelected,
              bloc: _bloc,
              builder: (context, state) {
                return AudioSelector(
                  name: _bloc.selectedIndex != null
                      ? _bloc.audioModelsList[_bloc.selectedIndex!].name
                      : null,
                  onTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return AudioSelectionModal(
                          bloc: _bloc,
                        );
                      },
                    );
                  },
                );
              },
            ),
            SizedBox(
              width: 10,
            ),
            TimeSelector()
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
          onPressed: () {
            context.push("/meditation_start");
          },
        )
      ],
    );
  }
}
