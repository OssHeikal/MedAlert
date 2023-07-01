import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_pill/core/presentation/widgets/custom_back_button.dart';
import 'package:smart_pill/core/presentation/widgets/custom_button.dart';
import 'package:smart_pill/core/presentation/widgets/custom_input_card.dart';
import 'package:smart_pill/core/resources/assets.dart';
import 'package:smart_pill/core/resources/colors.dart';
import 'package:smart_pill/core/resources/routes.dart';
import 'package:smart_pill/core/resources/values.dart';
import 'package:smart_pill/features/authentication/domain/entities/user_profile.dart';
import 'package:smart_pill/features/authentication/presentation/controller/auth/bloc/auth_bloc.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.authBloc,
  });
  final AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: AppPadding.mediumH,
          child: Row(
            children: [
              // GestureDetector(
              //   onTap: () => authBloc.add(AuthLogoutRequested()),
              //   child: Container(
              //     padding: const EdgeInsets.only(top: 2),
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //         color: AppColors.primary.withOpacity(0.7)),
              //     child: ClipRRect(
              //       borderRadius: BorderRadius.circular(10),
              //       child: Image.asset(
              //         AppAssets.profilePicture,
              //         fit: BoxFit.cover,
              //         width: 40,
              //       ),
              //     ),
              //   ),
              // ),
              // const SizedBox(width: 10),
              // Text.rich(
              //   TextSpan(
              //     text: 'Hello,\n',
              //     style: textTheme.titleSmall!.copyWith(
              //       fontSize: AppFontSize.f14.h,
              //     ),
              //     children: [
              //       TextSpan(
              //         text: authBloc.state.user.username,
              //         style: textTheme.titleLarge!.copyWith(
              //           fontSize: AppFontSize.f16.h,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Container(
                padding: const EdgeInsets.only(top: 2),
                child: Image.asset(
                  AppAssets.logo,
                  fit: BoxFit.cover,
                  height: 35,
                  width: AppWidth.w120.w,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () =>
                    context.pushNamed(AppRoutes.profile.name, extra: authBloc),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 20),
                icon: const Icon(Icons.person_outline),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                padding: const EdgeInsets.only(right: AppPadding.p4).w,
                constraints: const BoxConstraints(minWidth: 20),
                icon: const Icon(Icons.notifications_outlined),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
      ],
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({
    super.key,
    required this.authBloc,
  });
  // final UserProfile user;
  final AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    final UserProfile user = authBloc.state.user;
    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: AppColors.backgroundSecondary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.accent.withOpacity(0.1),
                child: Text(
                  user.username![0].toUpperCase(),
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accent,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomInputCard(
              content: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(user.username!),
              ),
              margin: AppMargin.mediumH.w,
              label: 'Username',
              leading: const Icon(Icons.person_outline),
            ),
            CustomInputCard(
              content: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(user.email!),
              ),
              label: 'Email',
              leading: const Icon(Icons.email_outlined),
            ),
            CustomButton(
              lable: 'Logout',
              onTap: () => authBloc.add(AuthLogoutRequested()),
              height: AppHeight.h40.h,
              backgroundColor: Colors.red,
              margin: AppMargin.xLarge.w,
            ),
            SizedBox(height: AppHeight.h60.h)
          ],
        ),
      ),
    );
  }
}
