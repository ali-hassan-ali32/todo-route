import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors_provider.dart';

class CustomDropDownWidget extends StatelessWidget {
  const CustomDropDownWidget({
    super.key,
    required this.context,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final BuildContext context;
  final String? value;
  final List<DropdownMenuItem<String>> items;
  final void Function(String? p1)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: ColorsProvider.primaly),
        color: Theme.of(context).cardColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height *
              0.02, // Responsive vertical padding
          horizontal: MediaQuery.of(context).size.width *
              0.04, // Responsive horizontal padding
        ),
        child: DropdownButton<String>(
          dropdownColor: Theme.of(context).cardColor,
          isExpanded: true,
          hint: const Text('Select an option'),
          underline: const SizedBox(),
          value: value,
          onChanged: onChanged,
          items: items,
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: MediaQuery.of(context).textScaleFactor * 20, // Adjusted size
          ),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: MediaQuery.of(context).textScaleFactor *
                    18, // Adjusted size
              ),
        ),
      ),
    );
  }
}
