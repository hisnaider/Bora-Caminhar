import 'package:bora_caminhar/components/index_indicator.dart';
import 'package:bora_caminhar/components/indicator_arrow.dart';
import 'package:bora_caminhar/components/primary_button.dart';
import 'package:bora_caminhar/constant.dart';
import 'package:flutter/material.dart';

class PersonInfoModal extends StatelessWidget {
  const PersonInfoModal({super.key});

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            color: Theme.of(context).colorScheme.background,
          ),
          child: Column(
            children: [
              Text(
                "Mudar informações",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              Divider(
                color: Colors.white.withOpacity(0.1),
                height: 25,
                thickness: 1,
              ),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _GenderButton(
                            buttonGender: Gender.male,
                          ),
                          _GenderButton(
                            buttonGender: Gender.female,
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    _HeightSlider(
                      height: 1.7,
                    )
                  ],
                ),
              ),
              PrimaryButton(
                title: "Confirmar mudanças",
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
        ),
      ],
    );
  }
}

class _HeightSlider extends StatefulWidget {
  const _HeightSlider({super.key, required this.height});
  final num height;

  @override
  State<_HeightSlider> createState() => _HeightSliderState();
}

class _HeightSliderState extends State<_HeightSlider> {
  final PageController controller =
      PageController(viewportFraction: 0.40, initialPage: 3 + 25);
  double newHeight = 1.7;

  /// This function is used to change the weight
  ///
  /// It updates the state of the widget with the new weight and prevents the
  /// user to change the weight to a value less than `min` and bigger than  `max`.
  void _updateWeight() {
    if (controller.page! < 3) {
      controller.jumpToPage(3);
    } else if (controller.page! > 25 + 3) {
      controller.jumpToPage(25 + 3);
    }
    double value = ((controller.page ?? 0) - 3) * 0.1;
    setState(() {
      newHeight = value;
    });
  }

  /// This functions is called when, and only when the widget is created.
  ///
  /// It defines a listener to [_updateWeight] function.
  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(_updateWeight);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 55,
            height: 175,
            child: Stack(
              children: [
                PageView.builder(
                  pageSnapping: false,
                  scrollDirection: Axis.vertical,
                  controller: controller,
                  reverse: true,
                  itemBuilder: (context, rawIndex) {
                    int? index = rawIndex - 3;
                    index = index >= 0 && index <= 25 ? index : null;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const IndexIndicator(
                            horizontal: false, numberOfItems: 10),
                        const SizedBox(
                          height: 5,
                        ),
                        if (index != null)
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child:
                                  Text("${(index * 0.1).toStringAsFixed(1)}"),
                            ),
                          ),
                      ],
                    );
                  },
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 25,
                    height: 10,
                    child: CustomPaint(
                      painter: IndexArrowIndicator(renderUpArrow: false),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "${newHeight.toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _GenderButton extends StatelessWidget {
  const _GenderButton({super.key, this.userGender, required this.buttonGender});
  final Gender? userGender;
  final Gender buttonGender;

  @override
  Widget build(BuildContext context) {
    IconData genderIcon = Icons.male_rounded;
    if (userGender == Gender.female) {
      genderIcon = Icons.female_rounded;
    }
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: primaryColor),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Icon(genderIcon),
    );
  }
}
