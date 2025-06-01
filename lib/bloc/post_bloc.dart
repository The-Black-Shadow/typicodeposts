import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:typicodeposts/data/models/post_model.dart';
import 'package:typicodeposts/data/repositories/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostRepository postRepository;
  PostBloc(this.postRepository) : super(PostInitial()) {
    on<LoadPosts>((event, emit) async {
      emit(PostLoading());
      try {
        final posts = await postRepository.fetchPosts();
        emit(PostLoaded(posts));
      } catch (e) {
        emit(PostError(e.toString()));
      }
    });
  }
}
