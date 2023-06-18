import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Model/user_model.dart';
import '../../Model/post_model.dart';

final bingoProvider = StateProvider<String?>((ref) => null);

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, List<UserModel>>(
        (ref) => UserNotifier());

final postProvider = FutureProvider<List<PostModel>>((ref) {
  final postRepository = ref.watch(postRepoProvider);
  return postRepository.getPostData();
});
