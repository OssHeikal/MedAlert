import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pill/core/presentation/widgets/custom_app_bar.dart';
import 'package:smart_pill/features/authentication/presentation/controller/auth/bloc/auth_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.authBloc});
  final AuthBloc authBloc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: authBloc,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'HomeView',
          actions: [
            IconButton(
              onPressed: () {
                authBloc.add(AuthLogoutRequested());
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          final user = state.user;
          return Center(
            child: Column(
              children: [
                Text('${user.username}\n${user.email}\n${user.id}'),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(UserProfileFetched());
                  },
                  child: const Text('Profile'),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
