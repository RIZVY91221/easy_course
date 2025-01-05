import 'package:bs_assignment/di/injectable.dart';
import 'package:bs_assignment/features/creat_post/controller/creat_post_controller.dart';
import 'package:bs_assignment/repository/base_repository.dart';
import 'package:get/get.dart';

class CreatePostBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CreatePostController>(() => CreatePostController(repository: getIt<BaseRepository>()));
  }

}