import 'package:bs_assignment/core/base/base_controller.dart';
import 'package:bs_assignment/core/base/paging_controller.dart';
import 'package:bs_assignment/core/controller/global_controller.dart';
import 'package:bs_assignment/core/widget/global/modal/app_modal.dart';
import 'package:bs_assignment/models/community_posts/feed_response.dart';
import 'package:bs_assignment/repository/base_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum FilterBy { newest, oldest, lowestPrice, heightPrice }

class HomeController extends BaseController {
  final BaseRepository repository;

  HomeController({required this.repository});


  var selectedTab = 0.obs;

  var selectFilter = ''.obs;
  var feedResource = List<FeedItemResponse>.empty(growable: true).obs;

  late CustomPaginationController<FeedItemResponse> paginationController = CustomPaginationController<FeedItemResponse>(
      onFetchPage: (pageKey, filterText, searchText) async => await getNewsFeedService());
  @override
  void onInit() {
    paginationController.initialize();
    selectedTab.listen((v){
      if(v==1){
        ConfirmationModal.show(header: "Logout",content: "Are you sure want to logout",button2: "No",button1: "Yes",onPressed: ()async{
          await callDataService(repository.logout(),onSuccess: (v)async{
            await repository.logout();
            await Get.find<GlobalController>().logOut();
          });
        });
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    paginationController.dispose();
    super.dispose();
  }

  /* ***
   * call data from repo
   * **/
  Future<List<FeedItemResponse>> getNewsFeedService() async {
    feedResource.value = await callDataService(repository.getCommunityFeedResponse(feedResource.value.isNotEmpty?"${feedResource.last.id}":""));
    return feedResource.value;
  }


  Future<void> onRefresh() async {
    paginationController.refresh(filter: '', search: '');
  }

}