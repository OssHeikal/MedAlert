import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_pill/core/presentation/widgets/custom_progress_indicator.dart';
import 'package:smart_pill/core/services/service_locator.dart';
import 'package:smart_pill/core/utils/enums.dart';
import 'package:smart_pill/features/medicine/presentation/controller/all_dispensers/bloc/all_dispensers_bloc.dart';
import 'package:smart_pill/features/medicine/presentation/components/dispenser_section.dart';

class DispenserWidget extends StatelessWidget {
  const DispenserWidget({
    super.key,
    required this.patientId,
  });
  final String patientId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AllDispensersBloc>(
      create: (context) => sl<AllDispensersBloc>(),
      child: BlocBuilder<AllDispensersBloc, AllDispensersState>(
        builder: (context, state) {
          switch (state.status) {
            case RequestStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case RequestStatus.success:
              return DispenserSection(
                  dispensers: state.dispensers, patientId: patientId);
            case RequestStatus.failure:
              return const Center(child: Text('Failed to load data'));
            default:
              return const Center(child: CustomProgressIndicator());
          }
        },
      ),
    );
  }
}
