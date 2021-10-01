import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final Color onHoverColor;
  final Color onPressedColor;
  final Color onFocusColor;

  factory RoundedButton.confirm({VoidCallback? onPressed}) => RoundedButton._(
        icon: Icons.check,
        backgroundColor: Colors.green,
        iconColor: Colors.white,
        onPressed: onPressed,
        onHoverColor: Colors.lightGreen,
        onPressedColor: Colors.blue,
        onFocusColor: Colors.lightGreen,
      );

  factory RoundedButton.close({VoidCallback? onPressed}) => RoundedButton._(
        icon: Icons.close_rounded,
        backgroundColor: Colors.black.withOpacity(0.05),
        iconColor: Colors.black,
        onPressed: onPressed,
        onHoverColor: Colors.black.withOpacity(0.15),
        onPressedColor: Colors.black.withOpacity(0.25),
        onFocusColor: Colors.black.withOpacity(0.15),
      );

  factory RoundedButton.addPrimary({VoidCallback? onPressed}) => RoundedButton._(
        icon: Icons.add,
        backgroundColor: Colors.green,
        iconColor: Colors.white,
        onPressed: onPressed,
        onHoverColor: Colors.lightGreen,
        onPressedColor: Colors.blue,
        onFocusColor: Colors.lightGreen,
      );
  factory RoundedButton.addPrimaryDarkMode({VoidCallback? onPressed}) => RoundedButton._(
        icon: Icons.add,
        backgroundColor: Colors.white,
        iconColor: Colors.green,
        onPressed: onPressed,
        onHoverColor: Colors.white.withOpacity(0.75),
        onPressedColor: Colors.white.withOpacity(0.50),
        onFocusColor: Colors.white.withOpacity(0.25),
      );

  factory RoundedButton.addSecondary({VoidCallback? onPressed}) => RoundedButton._(
        icon: Icons.add,
        backgroundColor: Colors.black.withOpacity(0.05),
        iconColor: Colors.black,
        onPressed: onPressed,
        onHoverColor: Colors.black.withOpacity(0.15),
        onPressedColor: Colors.black.withOpacity(0.25),
        onFocusColor: Colors.black.withOpacity(0.15),
      );

  factory RoundedButton.editPrimary({VoidCallback? onPressed}) => RoundedButton._(
        icon: Icons.edit,
        backgroundColor: Colors.green,
        iconColor: Colors.white,
        onPressed: onPressed,
        onHoverColor: Colors.lightGreen,
        onPressedColor: Colors.blue,
        onFocusColor: Colors.lightGreen,
      );

  factory RoundedButton.menu({VoidCallback? onPressed}) => RoundedButton._(
        icon: Icons.menu,
        backgroundColor: Colors.black.withOpacity(0.05),
        iconColor: Colors.black,
        onPressed: onPressed,
        onHoverColor: Colors.black.withOpacity(0.15),
        onPressedColor: Colors.black.withOpacity(0.25),
        onFocusColor: Colors.black.withOpacity(0.15),
      );

  const RoundedButton._({
    this.onPressed,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.onHoverColor,
    required this.onPressedColor,
    required this.onFocusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onPressed != null ? 1.0 : 0.5,
      child: ClipOval(
        child: FittedBox(
          child: SizedBox(
            height: 64,
            width: 64,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0.0),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return onPressedColor;
                    }
                    if (states.contains(MaterialState.focused)) {
                      return onFocusColor;
                    }
                    if (states.contains(MaterialState.hovered)) {
                      return onHoverColor;
                    }
                    return backgroundColor;
                  },
                ),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 36,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
