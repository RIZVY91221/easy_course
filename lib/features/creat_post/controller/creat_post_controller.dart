import 'dart:convert';

import 'package:bs_assignment/core/base/base_controller.dart';
import 'package:bs_assignment/core/uttils/functions.dart';
import 'package:bs_assignment/repository/base_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePostController extends BaseController{
  final BaseRepository repository;

  CreatePostController({required this.repository});

  TextEditingController contentTextController = TextEditingController();

  var selectedColorIndex = Rxn<int>(null);

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> postContent()async{
   if(contentTextController.text.isNotEmpty){
     Map<String,dynamic> task={
       "feed_txt":contentTextController.text,
       "community_id":2914,
       "space_id":5887,
       "uploadType":"text",
       "is_background":selectedColorIndex.value!=null?1:0,
       "activity_type":"group",
       "bg_color":selectedColorIndex.value!=null?json.encode(FN.feedBackGroundGradientColors[selectedColorIndex.value!]):null
     };
     await callDataService(onStart: ()=>showLoading(),repository.createPost(task),onSuccess: (v){
       Get.back();
     });
   }
  }
}