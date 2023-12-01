import 'package:bora_caminhar/screens/meditation/bloc/meditation_bloc.dart';
import 'package:bora_caminhar/screens/meditation/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MeditationPage extends StatelessWidget {
  const MeditationPage({super.key});

  @override
  Widget build(BuildContext context) {
    MeditationBloc _meditation_bloc = MeditationBloc();
    return Padding(
      padding: EdgeInsets.all(10),
      child: BlocProvider(
        create: (context) => _meditation_bloc,
        child: MeditationBody(),
      ),
    );
  }
}
