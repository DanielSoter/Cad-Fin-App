import 'package:flutter/material.dart';

class CustomColors {
  Color _activePrimaryButton = Color.fromARGB(255, 201, 51, 51);
  Color _activeSecondaryButton = Color.fromARGB(255, 230, 230, 255);
  Color _gradientMainColor = Color(0xFFFF9974);
  Color _gradientSecColor = Color(0xFF0B1C36);
  Color _appBarMainColor = Color(0xffbb6629);

  Color getActivePrimaryButtonColor() {
    return _activePrimaryButton;
  }

  Color getActiveSecondaryButton() {
    return _activeSecondaryButton;
  }

  Color getGradientMainColor() {
    return _gradientMainColor;
  }

  Color getGradientSecondaryColor() {
    return _gradientSecColor;
  }

  Color getAppBarMainColor() {
    return _appBarMainColor;
  }
}
