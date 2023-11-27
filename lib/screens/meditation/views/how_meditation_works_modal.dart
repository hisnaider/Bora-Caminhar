import 'package:bora_caminhar/components/modal_container.dart';
import 'package:bora_caminhar/components/primary_button.dart';
import 'package:bora_caminhar/screens/meditation/contants.dart';
import 'package:flutter/material.dart';

class HowMeditationWorksModal extends StatelessWidget {
  const HowMeditationWorksModal({super.key});

  @override
  Widget build(BuildContext context) {
    String language = "pt-br";

    return ModalContainer(
      title: MeditationConstants.howItWorksTitle[language]!,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: MeditationConstants.howItWorks[language]!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              Map<String, dynamic> text =
                  MeditationConstants.howItWorks[language]![index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: text["title"] == null
                    ? Text(
                        text["text"],
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.justify,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            text["title"],
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          if (text["textList"] == null)
                            Text(
                              text["text"],
                              style: Theme.of(context).textTheme.bodySmall,
                              textAlign: TextAlign.justify,
                            )
                          else
                            ListView.builder(
                              itemCount: text["textList"].length,
                              shrinkWrap: true,
                              itemBuilder: (context, subIndex) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Icon(
                                        Icons.circle_sharp,
                                        size: 5,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        text["textList"][subIndex],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                        textAlign: TextAlign.justify,
                                      ),
                                    )
                                  ],
                                );
                              },
                            )
                        ],
                      ),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
        PrimaryButton(
          title: "Voltar",
          centralizeTitle: true,
          textStyle: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.background),
          padding: const EdgeInsets.all(10),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
