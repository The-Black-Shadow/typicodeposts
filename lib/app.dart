import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typicodeposts/bloc/post_bloc.dart';
import 'package:typicodeposts/data/repositories/post_repository.dart';
import 'package:typicodeposts/presentation/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PostRepository(),
      child: BlocProvider(
        create: (context) => PostBloc(context.read<PostRepository>()),
        child: MaterialApp(
          title: 'API Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
