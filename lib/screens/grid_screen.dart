import 'package:class_test/models/name_model.dart';
import 'package:flutter/material.dart';

class GridScreen extends StatefulWidget {
  final NameModel nameModel;
  const GridScreen({super.key, required this.nameModel});

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  List<bool> buttonStates = [];
  List<int> removedButtonIndices = [];

  @override
  void initState() {
    super.initState();
    if (widget.nameModel.name.isNotEmpty) {
      buttonStates = List.filled(widget.nameModel.name.length, false);
    }
  }

  List<int> get remainingButtonIndices =>
      List.generate(widget.nameModel.name.length, (index) => index)
        ..removeWhere((index) => removedButtonIndices.contains(index));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          key: Key(remainingButtonIndices.toString()), // Add this line
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
          ),
          padding: const EdgeInsets.all(20),
          itemCount: remainingButtonIndices.length,
          itemBuilder: (context, index) {
            final buttonIndex = remainingButtonIndices[index];
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    buttonStates[buttonIndex] ? Colors.green : null,
              ),
              onPressed: () {
                setState(() {
                  if (buttonStates[buttonIndex]) {
                    removedButtonIndices.add(buttonIndex);
                  } else {
                    buttonStates[buttonIndex] = !buttonStates[buttonIndex];
                  }
                });
              },
              child: Text(widget.nameModel.name[buttonIndex]),
            );
          },
        ),
      ),
    );
  }
}
