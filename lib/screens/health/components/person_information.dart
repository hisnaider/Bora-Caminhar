import 'package:bora_caminhar/components/primary_button.dart';
import 'package:bora_caminhar/screens/health/views/person_info_modal.dart';
import 'package:flutter/material.dart';

class PersonInformation extends StatelessWidget {
  /// This widget represents person's information, informations such as gender
  /// age and height
  ///
  /// It contains a title, 3 text with the informations and a [PrimaryButton] to open
  /// the modal to edit the informations
  ///
  /// It has 3 parameters:
  /// - [gender]: User's gender;
  /// - [age]: User's age;
  /// - [height]: User's height.
  const PersonInformation(
      {super.key,
      required this.gender,
      required this.age,
      required this.height});
  final String gender;
  final int age;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Você",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            gender,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            "$age Anos",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            "$height metros",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          PrimaryButton(
            title: "Mudar info",
            icon: Icons.boy_rounded,
            centralizeTitle: false,
            padding: EdgeInsets.all(5),
            textStyle: TextStyle(
                fontFamily: "Roboto",
                color: Theme.of(context).colorScheme.background,
                fontWeight: FontWeight.w600),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return const PersonInfoModal();
                },
              );
            },
          )
        ],
      ),
    );
  }
}
