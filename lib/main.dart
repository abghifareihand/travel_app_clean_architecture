import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/features/destination/presentation/bloc/all_destination/all_destination_bloc.dart';
import 'package:travel_app/features/destination/presentation/bloc/search_destination/search_destination_bloc.dart';
import 'package:travel_app/features/destination/presentation/bloc/top_destination/top_destination_bloc.dart';
import 'package:travel_app/features/destination/presentation/cubit/dashboard_cubit.dart';
import 'package:travel_app/features/destination/presentation/pages/dashboard.dart';
import 'package:travel_app/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DashboardCubit()),
        BlocProvider(create: (context) => locator<AllDestinationBloc>()),
        BlocProvider(create: (context) => locator<TopDestinationBloc>()),
        BlocProvider(create: (context) => locator<SearchDestinationBloc>()),
      ],
      child: const MaterialApp(
        home: Dashboard(),
      ),
    );
  }
}
