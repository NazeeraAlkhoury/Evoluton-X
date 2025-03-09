import 'package:evoluton_x/features/scaning/presentation/widgets/scaning_view_body.dart';
import 'package:evoluton_x/features/scaning/presentation/widgets/scanning_appbar.dart';
import 'package:flutter/material.dart';

class ScaningView extends StatelessWidget {
  const ScaningView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: ScaningAppBar(),
      body: ScaningViewBody(),
    );
  }
}





// Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//             gradient: LinearGradient(colors: const [
//               Color(0xFF2607E7),
//               Color(0xFF57C0EF),
//               Colors.grey,
//             ], stops: [
//               progress / 2,
//               progress,
//               progress,
//             ])),
//         child: const SizedBox(height: 10),
//       ),