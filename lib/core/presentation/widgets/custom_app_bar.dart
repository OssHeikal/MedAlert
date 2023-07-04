import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:med_alert/core/resources/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.backgroundColor,
    this.actions,
    this.title = '',
  });
  final Color? backgroundColor;
  final List<Widget>? actions;
  final String title;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: backgroundColor,
      leading: context.canPop()
          ? IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back_ios, color: AppColors.primary),
            )
          : null,
      actions: actions,
    );
  }
}


// AppBar(
//           toolbarHeight: kToolbarHeight + 10.h,
//           // scrolledUnderElevation: 1,
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text.rich(
//                 TextSpan(
//                   text: 'Hello,\n',
//                   style: textTheme.titleSmall!.copyWith(
//                     fontSize: AppFontSize.f14.h,
//                   ),
//                   children: [
//                     TextSpan(
//                       text: 'Mohn Doe',
//                       style: textTheme.titleLarge!.copyWith(
//                         fontSize: AppFontSize.f16.h,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           leadingWidth: 50,
//           leading: Container(
//             margin: const EdgeInsets.fromLTRB(14, 14, 0, 14).h,
//             padding: const EdgeInsets.only(top: 2),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: AppColors.primary.withOpacity(0.7)),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Image.asset(AppAssets.profilePicture, fit: BoxFit.cover),
//             ),
//           ),
//           actions: [
//             const Icon(Icons.search),
//             Container(
//               margin: const EdgeInsets.fromLTRB(10, 0, 16, 0).h,
//               child: IconButton(
//                 onPressed: () {},
//                 padding: EdgeInsets.zero,
//                 constraints: const BoxConstraints(minWidth: 20),
//                 icon: const Icon(Icons.notifications_outlined),
//               ),
//             ),
//           ],
//         ),



// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const CustomAppBar({
//     super.key,
//     this.appBarHeight = 0,
//   });

//   final double? appBarHeight;

//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight + appBarHeight!);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       elevation: 0,
//       // backgroundColor: Colors.grey[300],
//       toolbarHeight: kToolbarHeight + appBarHeight!,
//       title: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('Hello,', style: Theme.of(context).textTheme.titleSmall),
//           Text('John Doe', style: Theme.of(context).textTheme.titleMedium),
//         ],
//       ),
//       leading: Container(
//         // padding: const EdgeInsets.only(top: 3),
//         margin: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//             // borderRadius: BorderRadius.circular(10),
//             shape: BoxShape.circle,
//             color: AppColors.primary.withOpacity(0.7)),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(100),
//           child: Image.asset(
//             AppAssets.profilePicture,
//             fit: BoxFit.cover,
//             width: 40,
//           ),
//         ),
//       ),
//       actions: [
//         IconButton(
//           onPressed: () {},
//           icon: const Icon(
//             Icons.notifications_outlined,
//             size: 30,
//           ),
//         ),
//         // notification button
//       ],
//     );
//   }
// }