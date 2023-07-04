import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:med_alert/core/resources/assets.dart';
import 'package:med_alert/core/resources/routes.dart';
import 'package:med_alert/core/resources/values.dart';
import 'package:med_alert/features/authentication/presentation/controller/auth/bloc/auth_bloc.dart';

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
              Container(
                padding: const EdgeInsets.only(left: AppPadding.p6),
                child: Image.asset(
                  AppAssets.logo,
                  fit: BoxFit.fitWidth,
                  height: 35,
                  width: AppWidth.w126.w,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () =>
                    context.pushNamed(AppRoutes.setting.name, extra: authBloc),
                padding: const EdgeInsets.only(right: AppPadding.p6).w,
                constraints: const BoxConstraints(minWidth: 20),
                icon: const Icon(Icons.settings_outlined),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
      ],
    );
  }
}
