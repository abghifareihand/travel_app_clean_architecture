import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/features/destination/presentation/cubit/dashboard_cubit.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<DashboardCubit>().page,
      // body: BlocBuilder<DashboardCubit, int>(
      //   builder: (context, state) {
      //     return context.watch<DashboardCubit>().page;
      //   },
      // ),
      bottomNavigationBar: Material(
        elevation: 10,
        child: BlocBuilder<DashboardCubit, int>(
          builder: (context, state) {
            return SizedBox(
              height: 60,
              child: NavigationBar(
                selectedIndex: state,
                onDestinationSelected: (value) {
                  context.read<DashboardCubit>().change(value);
                },
                backgroundColor: Colors.white,
                surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                destinations:
                    context.read<DashboardCubit>().menuDashboard.map((nav) {
                  return NavigationDestination(
                    icon: Icon(
                      nav[1],
                      color: Colors.grey[500],
                    ),
                    label: nav[0],
                    tooltip: nav[0],
                    selectedIcon: Icon(
                      nav[1],
                      color: Theme.of(context).primaryColor,
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
