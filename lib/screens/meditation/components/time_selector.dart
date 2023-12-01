import 'package:bora_caminhar/screens/meditation/bloc/meditation_bloc.dart';
import 'package:bora_caminhar/screens/meditation/bloc/meditation_event.dart';
import 'package:bora_caminhar/screens/meditation/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeSelector extends StatelessWidget {
  const TimeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          MeditationConstants.time["pt-br"]!,
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
              SizedBox(
                height: 35,
                width: 35,
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 18,
                  physics: const FixedExtentScrollPhysics(),
                  diameterRatio: 1.25,
                  overAndUnderCenterOpacity: 0.25,
                  onSelectedItemChanged: (value) {
                    BlocProvider.of<MeditationBloc>(context)
                        .add(SelectTime(minute: value + 1));
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 60,
                    builder: (context, index) => Text(
                      "${index + 1}",
                    ),
                  ),
                ),
              ),
              const Text(
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
