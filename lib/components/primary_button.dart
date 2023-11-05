import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  /// This widget represents a button  with rounded corners, colored with the
  /// primary color. It contains a title and a icon (optional)
  ///
  /// It has 5 parameters:
  /// - [title] - Title of the button;
  /// - [height] - Height of the button (optional);
  /// - [icon] - Icon of the button (optional);
  /// - [centralizeTitle] - Determines whether the title should be centered or not
  /// - [padding] - Padding of the button;
  /// - [onPressed] - Function to call when the button is pressed.
  const PrimaryButton(
      {super.key,
      required this.title,
      this.height,
      this.icon,
      required this.centralizeTitle,
      required this.padding,
      required this.onPressed});
  final String title;
  final double? height;
  final IconData? icon;
  final bool centralizeTitle;
  final EdgeInsets padding;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: Theme.of(context).colorScheme.primary,
      padding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      constraints: BoxConstraints(minWidth: 88.0, minHeight: height ?? 36.0),
      visualDensity: VisualDensity.compact,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: centralizeTitle
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          icon != null
              ? Icon(
                  icon,
                  color: Theme.of(context).colorScheme.background,
                )
              : SizedBox.shrink(),
          Text(
            title,
            style: TextStyle(
                fontFamily: "Roboto",
                color: Theme.of(context).colorScheme.background,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
