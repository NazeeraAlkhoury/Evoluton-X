import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
// IconButton(
//   icon: Icon(
//     isFavorite ? Icons.favorite : Icons.favorite_border,
//     color: isFavorite ? Colors.redAccent : Colors.white,
//   ),
//   onPressed: () => bloc.add(ToggleFavoriteEvent(playerId)),
// ),

// class FavoriteButton extends StatelessWidget {
//   final bool isFavorite;
//   final VoidCallback onAdd;
//   final VoidCallback onRemove;

//   const FavoriteButton({
//     super.key,
//     required this.isFavorite,
//     required this.onAdd,
//     required this.onRemove,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSwitcher(
//       duration: const Duration(milliseconds: 300),
//       transitionBuilder: (child, animation) {
//         return FadeTransition(opacity: animation, child: child);
//       },
//       child: isFavorite
//           ? ElevatedButton.icon(
//               key: const ValueKey('remove'),
//               onPressed: onRemove,
//               icon: const Icon(Icons.favorite, color: Colors.white),
//               label: const Text('Remove from favorites'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.redAccent,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               ),
//             )
//           : ElevatedButton.icon(
//               key: const ValueKey('add'),
//               onPressed: onAdd,
//               icon: const Icon(Icons.favorite_border, color: Colors.white),
//               label: const Text('Add to favorites'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.teal,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               ),
//             ),
//     );
//   }
// }
