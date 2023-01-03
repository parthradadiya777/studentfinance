import 'package:flutter/material.dart';

class ChoiceChips extends StatefulWidget {
  final String header;
  final List<String> options;
  final String selected;
  final void Function(String) onSelected;

  const ChoiceChips(
      {Key? key,
      required this.header,
      required this.options,
      required this.selected,
      required this.onSelected})
      : super(key: key);

  @override
  State<ChoiceChips> createState() => _ChoiceChipsState();
}

class _ChoiceChipsState extends State<ChoiceChips> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(widget.header, textScaleFactor: 1.2),
      Wrap(
          spacing: 4,
          runSpacing: 4,
          children: widget.options
              .map((option) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    backgroundColor: const Color.fromRGBO(86,93,109,1),
                      labelStyle: const TextStyle(
                        color: Colors.white
                      ),
                      label: Text(option),
                      selected: widget.selected == option,
                      selectedColor: Colors.grey,
                      onSelected: (bool selected) {
                        if (selected) {
                          widget.onSelected(option);
                        } else {
                          widget.onSelected('');
                        }
                      })))
              .toList())
    ]);
  }
}
