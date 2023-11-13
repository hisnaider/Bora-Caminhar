import 'package:bora_caminhar/components/index_indicator.dart';
import 'package:bora_caminhar/components/primary_button.dart';
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
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        color: Colors.blue,
                      ),
                    ),
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

class _HeightSlider extends StatelessWidget {
  const _HeightSlider({super.key, required this.height});
  final num height;

  @override
  Widget build(BuildContext context) {
    final PageController controller =
        PageController(viewportFraction: 0.40, initialPage: 3 + 25);
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
            height: 150,
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
                        _IndexIndicator(),
                        const SizedBox(
                          height: 5,
                        ),
                        if (index != null)
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child:
                                  Text("${(index * 0.1).toStringAsFixed(1)}"),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              "$height",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _IndexIndicator extends StatelessWidget {
  const _IndexIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(10, (index) {
        double x = 0.5;
        double y = 10;
        if (index == 10 / 2) {
          x = 1;
          y = 18;
        }
        return Expanded(
          child: Column(
            children: [
              Transform.translate(
                offset: Offset(0, -x / 2),
                child: Container(
                  width: y,
                  height: x,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
