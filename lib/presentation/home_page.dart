import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typicodeposts/bloc/post_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Demo')),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostInitial) {
            context.read<PostBloc>().add(LoadPosts());
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return ListTile(
                  trailing: Text(post.userId.toString()),
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
