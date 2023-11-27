import 'package:bora_caminhar/screens/meditation/contants.dart';
import 'package:flutter/material.dart';

class AudioContainer extends StatelessWidget {
  const AudioContainer(
      {super.key,
      this.currentSelectedAudio,
      this.radioValue,
      required this.child});
  final int? radioValue;
  final int? currentSelectedAudio;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: 10, vertical: radioValue != null ? 10 : 0),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: child
        //  Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     ...children,
        //     Radio<int?>(
        //       value: radioValue,
        //       groupValue: currentSelectedAudio,
        //       onChanged: onChanged,
        //     )
        //   ],
        // ),
        );
  }
}
