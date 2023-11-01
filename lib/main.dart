import 'data/repo/maps_repo_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/web_services/place_webservices.dart';
import 'package:googlemaps/presentation/screens/maps_screen.dart';
import 'package:googlemaps/core/business_logic/cubit/maps_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (BuildContext context) =>
            MapsCubit(MapsRepoImp(PlaceWebServices())),
        child: const MapsScreen(),
      ),
    );
  }
}
