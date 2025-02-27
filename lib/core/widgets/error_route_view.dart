import 'package:flutter/material.dart';

class ErrorRouteView extends StatelessWidget {
  const ErrorRouteView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error"),
      ),
      body: const Center(
        child: Text("The page is not found."),
      ),
    );
  }
}
