import 'package:bora_caminhar/components/index_indicator.dart';
import 'package:bora_caminhar/components/indicator_arrow.dart';
import 'package:bora_caminhar/components/modal_container.dart';
import 'package:bora_caminhar/components/primary_button.dart';
import 'package:bora_caminhar/constants/constant.dart';
import 'package:flutter/material.dart';

class PersonInfoModal extends StatelessWidget {
  const PersonInfoModal({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalContainer(
      title: "Mudar informações",
      children: [
        const SizedBox(
          height: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    _GenderSelectWidget(),
                    SizedBox(
                      height: 10,
                    ),
                    _BirthDateSelect()
                  ],
                ),
              ),
              SizedBox(width: 24),
              _HeightSlider(
                height: 1.7,
              )
            ],
          ),
        ),
        SizedBox(height: 24),
        PrimaryButton(
          title: "Confirmar mudanças",
          centralizeTitle: true,
          padding: const EdgeInsets.all(10),
          onPressed: () {},
        )
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Altura", style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 5),
        Expanded(
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 55,
                  height: double.infinity,
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
                          return IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const IndexIndicator(
                                    horizontal: false, numberOfItems: 10),
                                const SizedBox(
                                  height: 5,
                                ),
                                if (index != null)
                                  Opacity(
                                    opacity: 0.25,
                                    child: Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                            "${(index * 0.1).toStringAsFixed(1)}"),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
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
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    "${newHeight.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// This widget allows the user to select their gender.
///
/// It consists of two [_GenderButton] widgets, one for the male gender and another
/// for the female gender. The selected gender is tracked using the [userGender] state,
/// and the [selectGender] method is used to update the selected gender.
class _GenderSelectWidget extends StatefulWidget {
  const _GenderSelectWidget({super.key});

  @override
  State<_GenderSelectWidget> createState() => __GenderSelectWidgetState();
}

class __GenderSelectWidgetState extends State<_GenderSelectWidget> {
  Gender? userGender;

  /// This function is called when one of the [_GenderButton] widgets is tapped,
  /// and it updates the state variable `userGender` with the selected gender.
  void selectGender(Gender gender) {
    setState(() {
      userGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Gênero",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _GenderButton(
                  buttonGender: Gender.male,
                  genderSelected: Gender.male == userGender,
                  selectGender: () => selectGender(Gender.male),
                ),
                const SizedBox(width: 10),
                _GenderButton(
                  buttonGender: Gender.female,
                  genderSelected: Gender.female == userGender,
                  selectGender: () => selectGender(Gender.female),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GenderButton extends StatelessWidget {
  /// Gender selection button.
  ///
  /// Displays a rounded container with a surface background containing an icon
  /// representing the gender. When tapped, the border color changes to the
  /// primary color, and the icon's opacity changes to 1.
  ///
  /// It has 3 parameters:
  /// - [genderSelected]: Bool to determine if the gender is selected;
  /// - [buttonGender]: Gender of the button;
  /// - [selectGender]: Callback function to select the gender.
  const _GenderButton({
    super.key,
    required this.genderSelected,
    required this.buttonGender,
    required this.selectGender,
  });
  final bool genderSelected;
  final Gender buttonGender;
  final VoidCallback selectGender;

  @override
  Widget build(BuildContext context) {
    /// Returns the gender icon based on the specified `buttonGender`.
    ///
    /// The function switches between male and female genders and returns the
    /// corresponding icon with a specific color and size.
    Icon genderIcon() {
      switch (buttonGender) {
        case Gender.male:
          return Icon(
            Icons.male_outlined,
            color: Colors.blue.shade300,
            size: 50,
          );
        case Gender.female:
          return Icon(
            Icons.female,
            color: Colors.red.shade300,
            size: 50,
          );
      }
    }

    return Expanded(
      child: InkWell(
        onTap: selectGender,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: genderSelected
                ? Border.all(width: 1, color: primaryColor)
                : null,
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Opacity(
            opacity: genderSelected ? 1 : 0.25,
            child: genderIcon(),
          ),
        ),
      ),
    );
  }
}

class _BirthDateSelect extends StatefulWidget {
  const _BirthDateSelect({super.key});

  @override
  State<_BirthDateSelect> createState() => _BirthDateSelectState();
}

class _BirthDateSelectState extends State<_BirthDateSelect> {
  int day = 1;
  int month = 1;
  int year = DateTime.now().year - 12;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Data de nascimento",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            _MyListWheelScrollView(
              childCount: daysAndMonth[month]["numberOfDays"],
              startValue: 1,
              onSelectedItemChanged: (value) {
                setState(() {
                  day = value;
                });
              },
            ),
            const SizedBox(width: 5),
            _MyListWheelScrollView(
              childCount: 12,
              startValue: 1,
              onSelectedItemChanged: (value) {
                setState(() {
                  month = value;
                });
              },
            ),
            const SizedBox(width: 5),
            _MyListWheelScrollView(
              childCount: 89,
              startValue: DateTime.now().year - 100,
              onSelectedItemChanged: (value) {
                setState(() {
                  year = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _MyListWheelScrollView extends StatelessWidget {
  const _MyListWheelScrollView(
      {super.key,
      required this.childCount,
      required this.startValue,
      required this.onSelectedItemChanged});
  final int childCount;
  final int startValue;
  final Function(int) onSelectedItemChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: startValue == 1 ? 60 : 90,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListWheelScrollView.useDelegate(
        itemExtent: 24,
        physics: const FixedExtentScrollPhysics(),
        diameterRatio: 1.25,
        overAndUnderCenterOpacity: 0.25,
        onSelectedItemChanged: (value) =>
            onSelectedItemChanged(value + startValue),
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: childCount,
          builder: (context, index) => Text(
            "${index + startValue}",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
