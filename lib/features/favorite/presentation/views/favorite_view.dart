import 'package:evoluton_x/core/utils/app_text_styles.dart';
import 'package:evoluton_x/features/players/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const CustomAppBar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Your Favorite Players : ',
                  style: AppTextStyles.styleSemiBold16(context),
                ),
              ),
            ),
            // SliverGrid.builder(
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     mainAxisSpacing: 6,
            //     crossAxisSpacing: 15,
            //   ),
            //   itemBuilder: (context, index) => GestureDetector(
            //     onTap: () {
            //       context.read<DetailsBloc>().add(const ResetPlayerEvent());
            //       Navigator.of(context).pushNamed(
            //         AppRoutes.playerCard,
            //         arguments: player,
            //       );
            //     },
            //     child: AspectRatio(
            //       aspectRatio: 1.01 / 1.06,
            //       child: Card(
            //         color: AppColors.primaryColor,
            //         elevation: 0,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         child: Column(
            //           mainAxisSize: MainAxisSize.min,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Flexible(
            //               child: Stack(
            //                 children: [
            //                   ClipRRect(
            //                     borderRadius: const BorderRadius.only(
            //                       topLeft: Radius.circular(10),
            //                       topRight: Radius.circular(10),
            //                     ),
            //                     child: CachedNetworkImage(
            //                       imageUrl: player.imageUrl.isNotEmpty
            //                           ? player.imageUrl[0]
            //                           : '',
            //                       fit: BoxFit.cover,
            //                       width: double.infinity,
            //                       errorWidget: (context, url, error) =>
            //                           const Icon(Icons.error),
            //                     ),
            //                   ),
            //                   const Icon(
            //                     Icons.favorite,
            //                     color: AppColors.redColor,
            //                     size: 24,
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             Text(
            //               player.club.name,
            //               style: AppTextStyles.styleRegular9(context),
            //             ),
            //             const SizedBox(
            //               height: 5,
            //             ),
            //             Text(
            //               player.name,
            //               style: AppTextStyles.styleSemiBold10(context),
            //             ),
            //             const Divider(
            //               thickness: 1,
            //               color: AppColors.darkGreyColor,
            //               height: 9,
            //             ),
            //             CustomPlayerInfoRow(
            //               player: player,
            //             ),
            //             const SizedBox(
            //               height: 3,
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
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
