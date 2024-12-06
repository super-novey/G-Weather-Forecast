import 'package:flutter/material.dart';
import 'package:g_weather_forecast/utils/constants/colors.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
          child: Divider(
            color: MyColors.dividerColor,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          "or",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: MyColors.dividerColor),
        ),
        const Flexible(
          child: Divider(
            color: MyColors.dividerColor,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}