import 'package:flutter/material.dart';

class CompareSummaryWidget extends StatelessWidget {
  final void Function() onTapBack;
  const CompareSummaryWidget({
    required this.onTapBack,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Compare Summary"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            onTapBack();
          },
        ),
      ),
      body: Center(
        child: Text("Compare Summary"),
      ),
    );
  }
}
