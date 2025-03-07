// import 'package:evoluton_x/bloc/filter_bloc.dart';
// import 'package:evoluton_x/bloc/filter_state.dart';
// import 'package:evoluton_x/core/widgets/app_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class FilterView extends StatelessWidget {
//   const FilterView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<String> nations = ["England", "Spain", "Italy", "Germany"];
//     return BlocProvider.value(
//       value: context.read<FilterBloc>(),
//       child: Scaffold(
//         body: Center(
//           child: BlocBuilder<FilterBloc, FilterState>(
//             builder: (context, state) {
//               return AppButton(
//                 textButton: state.savedNation ?? 'filter',
//                 onPressed: () {
//                   showDialog(
//                       context: context,
                      // barrierDismissible: false,
                      // barrierColor: Colors.black.withOpacity(0.8),
//                       builder: (context) {
//                         return BlocProvider.value(
//                           value: context.read<FilterBloc>(),
//                           child: BlocBuilder<FilterBloc, FilterState>(
//                             builder: (context, state) {
//                               FilterBloc bloc = context.read<FilterBloc>();
//                               // return CustomSelectableDialog(
//                               //     nations: nations, bloc: bloc);
//                             },
//                           ),
//                         );
//                       });
//                 },
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }





//  AlertDialog(
//                                 title: Text(
//                                   AppStrings.selectNation,
//                                   style: AppTextStyles.styleSemiBold16(context),
//                                 ),
//                                 content: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: nations
//                                       .map(
//                                         (option) => CustomSelectableTile(
//                                           title: option,
//                                           selectedOption: state.selectedNation,
//                                           onSelect: (nation) => bloc.add(
//                                             SelectedNationEvent(
//                                               selectedNation: nation,
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                       .toList(),
//                                 ),
//                                 actions: [
//                                   CustomFilterDialogActionButton(
//                                     textButton: AppStrings.send,
//                                     color: AppColors.primaryColor,
//                                     textColor: state.selectedNation != null
//                                         ? AppColors.buttonTextColor
//                                         : AppColors.offWhiteColor
//                                             .withOpacity(.4),
//                                     onPressed: state.selectedNation != null
//                                         ? () {
//                                             bloc.add(
//                                               SavedNationEvent(
//                                                   savedNation:
//                                                       state.selectedNation),
//                                             );
//                                             Navigator.of(context).pop();
//                                           }
//                                         : null,
//                                   ),
//                                   CustomFilterDialogActionButton(
//                                       textButton: AppStrings.cancel,
//                                       onPressed: () {
//                                         Navigator.of(context).pop();
//                                       }),
//                                 ],
//                                 actionsAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                                 elevation: 0,
//                               );