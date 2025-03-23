import 'dart:convert';
import 'dart:developer';
import 'package:clickcart/features/model/comapny_info.dart';
import 'package:clickcart/utils/service/api_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';

import '../../constants/api_path.dart';


class CompanyInfoController extends GetxController {


  ApiPath apiPath=ApiPath();


  CompanyInfo companyInfo=CompanyInfo();


  //// Rx Value  /////
  RxBool isLoading = RxBool(false);



  @override
  void onInit() {
    super.onInit();
    getCompanyInfo();
  }

  ///////// Method   /////////////

getCompanyInfo(){
  ApiRequest apiRequest = ApiRequest(url: ApiPath.companyInfoUrl);
  apiRequest.getRequest().then((res){

    if(res!.statusCode==200){
      companyInfo=CompanyInfo.fromJson(jsonDecode(res.body));
      ApiPath.baseUrl=companyInfo.data!.company!.baseUrl??"https://pet.devzcart.com/";
    }
  });
}

  getTopMenuBar(){
    ApiRequest apiRequest = ApiRequest(url: ApiPath.topMenuBarUrl);
    apiRequest.getRequest().then((res){
      if(res!.statusCode==200){
        companyInfo=CompanyInfo.fromJson(jsonDecode(res.body));
        ApiPath.baseUrl=companyInfo.data!.company!.baseUrl??"https://pet.devzcart.com/";
      }
    });
  }










  @override
  void onReady() {
    super.onReady();

  }
}
