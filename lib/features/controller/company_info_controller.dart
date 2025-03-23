// import 'dart:convert';
// import 'dart:developer';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:get/get_rx/get_rx.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/state_manager.dart';
//
//
// class ApprovalRequestController extends GetxController {
//   TextEditingController fromDateController = TextEditingController();
//   TextEditingController toDateController = TextEditingController();
//   TextEditingController fromEventDateController = TextEditingController();
//   TextEditingController toEventDateController = TextEditingController();
//   TextEditingController employeeNameTextController = TextEditingController();
//   TextEditingController approveCommentsController = TextEditingController();
//   TextEditingController eventUserController = TextEditingController();
//   TextEditingController nextAuthorityEventController = TextEditingController();
//   TextEditingController nextAuthorityEventNameController =
//       TextEditingController();
//   TextEditingController eventTitleController = TextEditingController();
//   TextEditingController eventPlaceController = TextEditingController();
//   TextEditingController eventDescriptionController = TextEditingController();
//   TextEditingController advancedTakenController = TextEditingController();
//   TextEditingController requisitionItemNameController = TextEditingController();
//   TextEditingController requisitionNoItemController = TextEditingController();
//   TextEditingController requisitionEstimateBudgetController =
//       TextEditingController();
//   TextEditingController eventProgramController = TextEditingController();
//   TextEditingController eventProgramNameController = TextEditingController();
//   TextEditingController eventProgramDateController = TextEditingController();
//   TextEditingController eventProgramTimeController = TextEditingController();
//   Rx<SearchEmployeeModel> getSearchEmployeeData = Rx(SearchEmployeeModel());
//   Rx<ApprovalListModel> employeeApprovalList = Rx(ApprovalListModel());
//
//   Rx<ApprovalHistoryModel> approvalHistory = Rx(ApprovalHistoryModel());
//   Rx<LeaveTypeList> leavetypeList = Rx(LeaveTypeList());
//   RxList<NextAuthorityTeamsModel> nextAuthorityTeams = RxList([]);
//   RxList<TeamUserForDropDownModel> teamUserForDropDownList = RxList([]);
//   Rx<NextAuthorityForLeaveModel> nextAuthorityForLeave =
//       Rx(NextAuthorityForLeaveModel());
//   // Rx<ApprovalTransectionTypeModel> transactionTypeData =
//   //     Rx(ApprovalTransectionTypeModel());
//   // Rx<NewApprovalListModel> newApprovalList = Rx(NewApprovalListModel());
//   Rx<EventDetails> eventDetails = Rx(EventDetails());
//   Rx<ApprovalDetailsModel> approvalDetails = Rx(ApprovalDetailsModel());
//   Rx<NextAuthorityForEventModel> nextAuthorityForEventData =
//       Rx(NextAuthorityForEventModel());
//   Rx<DropDownTransactionType> transactionType = Rx(DropDownTransactionType());
//
//   //// Rx Value  /////
//   RxString notifyUserId = RxString('');
//   RxBool hasAdvanceTaken = RxBool(false);
//   RxInt toTeamId = RxInt(0);
//   RxInt transactionTypeID = RxInt(0);
//   RxBool isLoading = RxBool(false);
//   RxBool isApprovalListLoading = RxBool(false);
//   RxBool isApprovalHistoryLoaded = RxBool(false);
//   RxBool isApproveLoaded = RxBool(false);
//   RxBool isEventDetailsLoaded = RxBool(false);
//   RxBool isLoadedList = RxBool(false);
//   RxBool isDetailsLoaded = RxBool(false);
//
//   String htmlData = 'No Data';
//   int length = 0;
//
//   ///////// Method
//   searchEmployeeByName() {
//     isLoading.value = true;
//     ApiRequest request = ApiRequest(
//         url: '${ApiPath.urlSearchEmployee}${employeeNameTextController.text}');
//     request.getRequestWithAuth().then((res) {
//       isLoading.value = false;
//       if (res!.statusCode == 200) {
//         getSearchEmployeeData.value = SearchEmployeeModel.fromJson(
//             jsonDecode(utf8.decode(res.bodyBytes)));
//       }
//     }).catchError((onError) {
//       isLoading.value = false;
//       print(onError.toString());
//     });
//   }
//
//   getEmployeeApprovalList({empID, fromDate, toDate}) {
//     var empId = empID != '' ? "employeeId=$empID&" : "";
//     isApprovalListLoading.value = true;
//     ApiRequest apiRequest = ApiRequest(
//         url:
//             '${ApiPath.urlEmployeeApprovalList}$empId&fromDate=$fromDate&toDate=$toDate');
//
//     apiRequest.getRequestWithAuth().then((res) {
//       // log(res!.body);
//       isApprovalListLoading.value = false;
//       if (res!.statusCode == 200) {
//         employeeApprovalList.value =
//             ApprovalListModel.fromJson(jsonDecode(res.body));
//       }
//     }).catchError((e) {
//       print(e.toString());
//     });
//   }
//
//   getNextAuthorityTeams({flowId, notifyUserId}) {
//     print('notifyUserId :  $notifyUserId   flowId $flowId');
//     ApiRequest apiRequest = ApiRequest(
//         url:
//             '${ApiPath.urlGetNextAuthorityTeams}flowId=$flowId&loginUserId=$notifyUserId');
//     apiRequest.getRequestWithAuth().then((res) {
//       if (res!.statusCode == 200) {
//         nextAuthorityTeams.value = (jsonDecode(res.body) as List)
//             .map((e) => NextAuthorityTeamsModel.fromJson(e))
//             .toList();
//       }
//     });
//   }
//
//   getTeamUserForDropDown({approvalTeamId}) {
//     ApiRequest apiRequest = ApiRequest(
//         url: ApiPath.urlTeamUserForDropDown + approvalTeamId.toString());
//     apiRequest.getRequestWithAuth().then((res) {
//       if (res!.statusCode == 200) {
//         teamUserForDropDownList.value = (jsonDecode(res.body) as List)
//             .map((e) => TeamUserForDropDownModel.fromJson(e))
//             .toList();
//       }
//     });
//   }
//
//   // getTransectionTypeListByUser() {
//   //   ApiRequest apiRequest =
//   //       ApiRequest(url: ApiPath.urlGetTransectionTypeListByUser);
//   //   apiRequest.getRequestWithAuth().then((res) {
//   //     if (res!.statusCode == 200) {
//   //       transactionTypeData.value =
//   //           ApprovalTransectionTypeModel.fromJson(jsonDecode(res.body));
//   //     }
//   //   });
//   // }
//
//   // getApprovalListByTransctionTypeAndUser({fromDate, toDate, int? typeId}) {
//   //   var id = typeId == null ? "" : "transectionTypeId=$typeId&";
//   //   isLoadedList.value = true;
//   //   ApiRequest apiRequest = ApiRequest(
//   //       url:
//   //           '${ApiPath.urlGetApprovalListByTransctionTypeAndUser}${id}fromDate=$fromDate&toDate=$toDate');
//   //   apiRequest.getRequestWithAuth().then((res) {
//   //     // log(res!.body);
//   //     isLoadedList.value = false;
//   //     if (res!.statusCode == 200) {
//   //       newApprovalList.value =
//   //           NewApprovalListModel.fromJson(jsonDecode(res.body));
//   //
//   //     }
//   //   }).catchError((e) {
//   //     isLoadedList.value = false;
//   //     if (kDebugMode) {
//   //       print(e.toString());
//   //     }
//   //   });
//   // }
//
//   approveForwardApplicationForLeave(
//       {approvalStatusName, approvalStatus, transactionTypeId}) {
//     var body = jsonEncode({
//       "id": 0,
//       "fromUserId": nextAuthorityForLeave.value.fromUserId,
//       "fromUserName": null,
//       "fromTeamId": nextAuthorityForLeave.value.fromTeamId,
//       "fromTeamName": null,
//       "notifyUserId": notifyUserId.value,
//       "notifyUserName": null,
//       "toTeamId": toTeamId.value,
//       "toTeamName": null,
//       "comments": approveCommentsController.text,
//       "transectionId": nextAuthorityForLeave.value.transectionId,
//       "tableName": nextAuthorityForLeave.value.tableName,
//       "transectionType": nextAuthorityForLeave.value.transectionType,
//       "transectionTypeName": nextAuthorityForLeave.value.transectionTypeName,
//       "transDescription": nextAuthorityForLeave.value.transDescription,
//       "approvalStatus": approvalStatus,
//       "approvalStatusName": approvalStatusName,
//       "totalAmount": null,
//       "isSeen": nextAuthorityForLeave.value.isSeen,
//       "seenDate": null,
//       "isClose": nextAuthorityForLeave.value.isClose,
//       "isActionTaken": nextAuthorityForLeave.value.isActionTaken,
//       "actionTakenBy": null,
//       "actionTakenDate": null,
//       "isSubmitUser": nextAuthorityForLeave.value.isSubmitUser,
//       "isForwardUser": nextAuthorityForLeave.value.isForwardUser,
//       "isFinalUser": nextAuthorityForLeave.value.isFinalUser,
//       "whenAgo": null,
//       "flowId": nextAuthorityForLeave.value.flowId,
//       "approvalDate": nextAuthorityForLeave.value.approvalDate,
//       "transectionHistoryId": nextAuthorityForLeave.value.transectionHistoryId
//     });
//     log(body);
//     print(transactionTypeId);
//     ApiRequest apiRequest =
//         ApiRequest(url: ApiPath.urlSubmitLeaveApplication, body: body);
//     apiRequest.postRequestWithAuth(isLoadingScreen: false).then((res) {
//       if (res!.statusCode == 200) {
//         // log(res.body);
//         Fluttertoast.showToast(
//             msg: '${LocalString.successfully.tr} $approvalStatusName ');
//         // getEmployeeApprovalList(empID:"",fromDate:TimeConvert.toYYYYmmdd(DateTime(DateTime.now().year,DateTime.now().month,1).toString()),toDate:TimeConvert.toYYYYmmdd(DateTime.now().toString()) );
//         // getApprovalListByTransctionTypeAndUser(fromDate: '2024-03-04', toDate: '2024-03-04');
//
//         if (transactionTypeId == -1) {
//           getEmployeeApprovalList(
//               empID: "",
//               fromDate: TimeConvert.toYYYYmmdd(
//                   DateTime.now().subtract(const Duration(days: 30)).toString()),
//               toDate: TimeConvert.toYYYYmmdd(DateTime.now().toString()));
//         } else if (transactionTypeId == 0) {
//           getGetApprovalItemByUser(
//               transectionId: nextAuthorityForLeave.value.transectionId,
//               transectionType: nextAuthorityForLeave.value.transectionType);
//         } else {
//           getApprovalListByTransactionId(
//               transactionTypeId: transactionTypeId,
//               fromDate: fromDateController.text,
//               toDate: toDateController.text);
//         }
//       }
//     });
//   }
//
//   rejectApprovalRequestForLeave(
//       {approvalStatusName, approvalStatus, transactionTypeId}) {
//     var body = jsonEncode({
//       "id": 0,
//       "fromUserId": nextAuthorityForLeave.value.fromUserId,
//       "fromUserName": nextAuthorityForLeave.value.fromUserName,
//       "fromTeamId": nextAuthorityForLeave.value.fromTeamId,
//       "fromTeamName": nextAuthorityForLeave.value.fromTeamName,
//       "notifyUserId": nextAuthorityForLeave.value.notifyUserId,
//       "notifyUserName": nextAuthorityForLeave.value.notifyUserName,
//       "toTeamId": nextAuthorityForLeave.value.toTeamId,
//       "toTeamName": nextAuthorityForLeave.value.toTeamName,
//       "comments": approveCommentsController.text,
//       "transectionId": nextAuthorityForLeave.value.transectionId,
//       "tableName": nextAuthorityForLeave.value.tableName,
//       "transectionType": nextAuthorityForLeave.value.transectionType,
//       "transectionTypeName": nextAuthorityForLeave.value.transectionTypeName,
//       "transDescription": nextAuthorityForLeave.value.transDescription,
//       "approvalStatus": approvalStatus,
//       "approvalStatusName": approvalStatusName,
//       "totalAmount": 0,
//       "isSeen": nextAuthorityForLeave.value.isSeen,
//       "seenDate": nextAuthorityForLeave.value.seenDate,
//       "isClose": nextAuthorityForLeave.value.isClose,
//       "isActionTaken": nextAuthorityForLeave.value.isActionTaken,
//       "actionTakenBy": nextAuthorityForLeave.value.actionTakenBy,
//       "actionTakenDate": nextAuthorityForLeave.value.actionTakenDate,
//       "isSubmitUser": nextAuthorityForLeave.value.isSubmitUser,
//       "isForwardUser": nextAuthorityForLeave.value.isForwardUser,
//       "isFinalUser": nextAuthorityForLeave.value.isFinalUser,
//       "whenAgo": nextAuthorityForLeave.value.whenAgo,
//       "flowId": nextAuthorityForLeave.value.flowId,
//       "approvalDate": nextAuthorityForLeave.value.approvalDate,
//       "transectionHistoryId": nextAuthorityForLeave.value.transectionHistoryId
//     });
// log(body);
//     ApiRequest apiRequest =
//         ApiRequest(url: ApiPath.urlRejectApprovalRequest, body: body);
//
//     apiRequest.postRequestWithAuth(isLoadingScreen: false).then((res) {
//       print([res!.statusCode, res.body]);
//
//       if (res.statusCode == 200) {
//         Fluttertoast.showToast(msg: LocalString.request_Reject_Successfully.tr);
//         // getEmployeeApprovalList(empID:"",fromDate:TimeConvert.toYYYYmmdd(DateTime(DateTime.now().year,DateTime.now().month,1).toString()),toDate:TimeConvert.toYYYYmmdd(DateTime.now().toString()) );
//         // getEmployeeApprovalList(
//         //     empID: "",
//         //     fromDate: TimeConvert.toYYYYmmdd(
//         //         DateTime.now().subtract(Duration(days: 30)).toString()),
//         //     toDate: TimeConvert.toYYYYmmdd(DateTime.now().toString()));
//         if (transactionTypeId == -1) {
//           getEmployeeApprovalList(
//               empID: "",
//               fromDate: TimeConvert.toYYYYmmdd(
//                   DateTime.now().subtract(const Duration(days: 30)).toString()),
//               toDate: TimeConvert.toYYYYmmdd(DateTime.now().toString()));
//         } else if (transactionTypeId == 0) {
//           getGetApprovalItemByUser(
//               transectionId: nextAuthorityForLeave.value.transectionId,
//               transectionType: nextAuthorityForLeave.value.transectionType);
//         } else {
//           getApprovalListByTransactionId(
//               transactionTypeId: transactionTypeId,
//               fromDate: fromDateController.text,
//               toDate: toDateController.text);
//         }
//       }
//     });
//   }
//
//   getApprovalHistory({transectionType, transectionId}) {
//     isApprovalHistoryLoaded.value = true;
//     ApiRequest apiRequest = ApiRequest(
//         url:
//             '${ApiPath.urlTransectionHistoryForSubmit}transectionType=$transectionType&transectionId=$transectionId');
//     apiRequest.getRequestWithAuth().then((res) {
//       isApprovalHistoryLoaded.value = false;
//       if (res!.statusCode == 200) {
//         approvalHistory.value =
//             ApprovalHistoryModel.fromJson(jsonDecode(res.body));
//       }
//     }).catchError((e) {
//       if (kDebugMode) {
//         print(e.toString());
//       }
//     });
//   }
//
//   getLeaveTypeList() {
//     ApiRequest apiRequest = ApiRequest(url: ApiPath.urlLeaveTypeList);
//     apiRequest.getRequestWithAuth().then((res) {
//       if (res!.statusCode == 200) {
//         leavetypeList.value = LeaveTypeList.fromJson(jsonDecode(res.body));
//       }
//     });
//   }
//
//   finalUserCheck(
//       {flowId, transectionId, tableName, transectionHistoryId}) async {
//     isApproveLoaded.value = true;
//     ApiRequest apiRequest = ApiRequest(
//         url:
//             '${ApiPath.urlCheckFinalUser}flowId=$flowId&transectionId=$transectionId&tableName=$tableName&transectionHistoryId=$transectionHistoryId');
//     apiRequest.getRequestWithAuth().then((res) {
//       isApproveLoaded.value = false;
//
//       if (res!.statusCode == 200) {
//         nextAuthorityForLeave.value =
//             NextAuthorityForLeaveModel.fromJson(jsonDecode(res.body));
//         // var data = jsonDecode(res.body);
//         // isFinalUser.value = data["isFinalUser"];
//       }
//     }).catchError((e) {
//       // isFinalUser.value = false;
//     });
//   }
//
//   getGetApprovalItemByUser({transectionId, transectionType}) {
//     print(transectionType);
//     print(transectionId);
//     isDetailsLoaded.value = true;
//     ApiRequest apiRequest = ApiRequest(
//         url:
//             '${ApiPath.urlGetApprovalItemByUser}TransectionId=${transectionId}&TransectionType=${transectionType}');
//
//     apiRequest.getRequestWithAuth().then((res) {
//       isDetailsLoaded.value = false;
//       if (res!.statusCode == 200) {
//         approvalDetails.value =
//             ApprovalDetailsModel.fromJson(jsonDecode(res.body));
//       }
//     }).catchError((e) {
//       isDetailsLoaded.value = false;
//     });
//   }
//
//   ///////////////////////////////////////// ////// For Event ///////////////////////////////////////////////////////////////
//
//   getEventDetails({transactionId}) {
//     isEventDetailsLoaded.value = true;
//     ApiRequest apiRequest =
//         ApiRequest(url: '${ApiPath.urlEventDetails}EventId=${transactionId}');
//     apiRequest.getRequestWithAuth().then((res) {
//       isEventDetailsLoaded.value = false;
//       // log(res!.body);
//       if (res!.statusCode == 200) {
//         eventDetails.value = EventDetails.fromJson(jsonDecode(res.body));
//
//         htmlData = eventDetails.value.data?.description ?? 'No Data';
//         length = htmlData.length;
//
//         print(htmlData);
//
//         getValueFromController();
//       }
//     });
//   }
//
//   getNextAuthorityForEvent({transectionId, transectionType}) {
//     print(transectionId);
//     print(transectionType);
//     // isEventDetailsLoaded.value=true;
//     ApiRequest apiRequest = ApiRequest(
//         url:
//             '${ApiPath.urlNextAuthorityForEvent}EventId=${transectionId}&TransectionType=${transectionType}');
//     apiRequest.getRequestWithAuth().then((res) {
//       // log(res!.body);
//       if (res!.statusCode == 200) {
//         nextAuthorityForEventData.value =
//             NextAuthorityForEventModel.fromJson(jsonDecode(res.body));
//         nextAuthorityEventController.text =
//             nextAuthorityForEventData.value.data?.transectionTypeName ?? '';
//         nextAuthorityEventNameController.text =
//             nextAuthorityForEventData.value.data?.notifyUserName ?? '';
//       }
//     });
//   }
//
//   getValueFromController() {
//     eventTitleController.text = eventDetails.value.data?.eventTitle ?? '';
//     fromEventDateController.text =
//         TimeConvert.toYYYYmmdd(eventDetails.value.data?.startDate ?? '');
//     toEventDateController.text =
//         TimeConvert.toYYYYmmdd(eventDetails.value.data?.endDate ?? '');
//     eventPlaceController.text = eventDetails.value.data?.eventPlace ?? '';
//     advancedTakenController.text =
//         eventDetails.value.data?.advanceTaken.toString() ?? '0.0';
//     eventDescriptionController.text =
//         eventDetails.value.data?.description ?? '';
//     hasAdvanceTaken.value = eventDetails.value.data?.hasAdvanceTaken ?? false;
//   }
//
//   getTransactionType() {
//     ApiRequest apiRequest = ApiRequest(url: ApiPath.urlTransactionTypeDropDown);
//     apiRequest.getRequestWithAuth().then((res) {
//       if (res!.statusCode == 200) {
//         transactionType.value =
//             DropDownTransactionType.fromJson(jsonDecode(res.body));
//       }
//     });
//   }
//
//   getApprovalListByTransactionId({transactionTypeId, fromDate, toDate}) {
//     String fDate = fromDate == null || fromDate == ''
//         ? TimeConvert.toYYYYmmdd(
//             DateTime.now().subtract(Duration(days: 29)).toString())
//         : fromDate;
//     String tDate = toDate == null || toDate == ''
//         ? TimeConvert.toYYYYmmdd(DateTime.now().toString())
//         : toDate;
//     isApprovalListLoading.value = true;
//     var baseUrl =
//         '${ApiPath.urlGetApprovalListByTransactionType}transectionTypeId=$transactionTypeId&fromDate=$fDate&toDate=$tDate';
//     ApiRequest apiRequest = ApiRequest(url: baseUrl);
//     print(baseUrl);
//     apiRequest.getRequestWithAuth().then((res) {
//       print(res!.statusCode);
//       isApprovalListLoading.value = false;
//       if (res!.statusCode == 200) {
//         employeeApprovalList.value =
//             ApprovalListModel.fromJson(jsonDecode(res.body));
//       }
//     }).catchError((e) {
//       print(e.toString());
//     });
//   }
//
//   approveForwardApplicationForEvent(
//       {approvalStatusName,
//       approvalStatus,
//       // index,
//       transactionTypeId}) {
//     var body = jsonEncode({
//       "id": 0,
//       "fromUserId": approvalDetails.value.data?.notifyUserId,
//       "fromUserName": approvalDetails.value.data?.notifyUserName,
//       "fromTeamId": approvalDetails.value.data?.fromTeamId,
//       "fromTeamName": approvalDetails.value.data?.fromTeamName,
//       "notifyUserId": nextAuthorityForEventData.value.data?.notifyUserId,
//       "notifyUserName": nextAuthorityForEventData.value.data?.notifyUserName,
//       "toTeamId": approvalDetails.value.data?.toTeamId,
//       "toTeamName": approvalDetails.value.data?.toTeamName,
//       "comments": approveCommentsController.text,
//       "transectionId": approvalDetails.value.data?.transectionId,
//       "tableName": approvalDetails.value.data?.tableName,
//       "transectionType": approvalDetails.value.data?.transectionType,
//       "transectionTypeName": approvalDetails.value.data?.transectionTypeName,
//       "transDescription": approvalDetails.value.data?.transDescription,
//       "approvalStatus": approvalStatus,
//       "approvalStatusName": approvalStatusName,
//       "totalAmount": approvalDetails.value.data?.totalAmount,
//       "isSeen": approvalDetails.value.data?.isSeen,
//       "seenDate": null,
//       "isClose": approvalDetails.value.data?.isClose,
//       "isActionTaken": true,
//       "actionTakenBy": null,
//       "actionTakenDate": null,
//       "isSubmitUser":
//           nextAuthorityForEventData.value.data?.isSubmitUser ?? false,
//       "isForwardUser":
//           nextAuthorityForEventData.value.data?.isForwardUser ?? false,
//       "isFinalUser": nextAuthorityForEventData.value.data?.isFinalUser ?? false,
//       "whenAgo": null,
//       "flowId": approvalDetails.value.data?.flowId,
//       "approvalDate": approvalDetails.value.data?.approvalDate,
//       "transectionHistoryId": approvalDetails.value.data?.id
//     });
//     log(body);
//     print(["transactionTypeId",transactionTypeId]);
//     ApiRequest apiRequest =
//         ApiRequest(url: ApiPath.urlSubmitLeaveApplication, body: body);
//     apiRequest.postRequestWithAuth(isLoadingScreen: false).then((res) {
//       if (res!.statusCode == 200) {
//         Fluttertoast.showToast(
//             msg: '${LocalString.successfully.tr} $approvalStatusName ');
//         // getEmployeeApprovalList(empID:"",fromDate:TimeConvert.toYYYYmmdd(DateTime(DateTime.now().year,DateTime.now().month,1).toString()),toDate:TimeConvert.toYYYYmmdd(DateTime.now().toString()) );
//         // getApprovalListByTransctionTypeAndUser(fromDate: TimeConvert.toYYYYmmdd(
//         //     DateTime.now().subtract(const Duration(days: 30)).toString()),
//         //     toDate: TimeConvert.toYYYYmmdd(DateTime.now().toString()));
//
//         // getEmployeeApprovalList(
//         //     empID: "",
//         //     fromDate: TimeConvert.toYYYYmmdd(
//         //         DateTime.now().subtract(const Duration(days: 30)).toString()),
//         //     toDate: TimeConvert.toYYYYmmdd(DateTime.now().toString()));
//         if (transactionTypeId == -1) {
//           getEmployeeApprovalList(
//               empID: "",
//               fromDate: TimeConvert.toYYYYmmdd(
//                   DateTime.now().subtract(const Duration(days: 30)).toString()),
//               toDate: TimeConvert.toYYYYmmdd(DateTime.now().toString()));
//         } else if (transactionTypeId == 0) {
//           getGetApprovalItemByUser(
//               transectionId:approvalDetails.value.data?.transectionId,
//               transectionType: approvalDetails.value.data?.transectionType);
//         } else {
//           getApprovalListByTransactionId(
//               transactionTypeId: transactionTypeId,
//               fromDate: fromDateController.text,
//               toDate: toDateController.text);
//         }
//       }
//     });
//   }
//
//   rejectApprovalRequestForEvent(
//       {approvalStatusName,
//       approvalStatus,
//       // index,
//       transactionTypeId}) {
//     var body = jsonEncode({
//       "id": 0,
//       "fromUserId": approvalDetails.value.data?.notifyUserId,
//       "fromUserName": null,
//       "fromTeamId": approvalDetails.value.data?.fromTeamId,
//       "fromTeamName": null,
//       "notifyUserId": nextAuthorityForEventData.value.data?.notifyUserId,
//       "notifyUserName": nextAuthorityForEventData.value.data?.notifyUserName,
//       "toTeamId": 0,
//       "toTeamName": null,
//       "comments": approveCommentsController.text,
//       "transectionId": approvalDetails.value.data?.transectionId,
//       "tableName": approvalDetails.value.data?.tableName,
//       "transectionType": approvalDetails.value.data?.transectionType,
//       "transectionTypeName": approvalDetails.value.data?.transectionTypeName,
//       "transDescription": approvalDetails.value.data?.transDescription,
//       "approvalStatus": approvalStatus,
//       "approvalStatusName": approvalStatusName,
//       "totalAmount": null,
//       "isSeen": approvalDetails.value.data?.isSeen,
//       "seenDate": null,
//       "isClose": approvalDetails.value.data?.isClose,
//       "isActionTaken": true,
//       "actionTakenBy": null,
//       "actionTakenDate": null,
//       "isSubmitUser": false,
//       "isForwardUser":
//           nextAuthorityForEventData.value.data?.notifyUserId == null
//               ? false
//               : true,
//       "isFinalUser": nextAuthorityForEventData.value.data?.notifyUserId == null
//           ? true
//           : false,
//       "whenAgo": null,
//       "flowId": approvalDetails.value.data?.flowId,
//       "approvalDate": approvalDetails.value.data?.approvalDate,
//       "transectionHistoryId": approvalDetails.value.data?.id
//     });
//     log(body);
//     print(["transactionTypeId", transactionTypeId]);
//     ApiRequest apiRequest =
//         ApiRequest(url: ApiPath.urlRejectApprovalRequest, body: body);
//
//     apiRequest.postRequestWithAuth(isLoadingScreen: false).then((res) {
//       print([res!.statusCode, res.body]);
//
//       if (res.statusCode == 200) {
//         Fluttertoast.showToast(msg: LocalString.request_Reject_Successfully.tr);
//         // getEmployeeApprovalList(empID:"",fromDate:TimeConvert.toYYYYmmdd(DateTime(DateTime.now().year,DateTime.now().month,1).toString()),toDate:TimeConvert.toYYYYmmdd(DateTime.now().toString()) );
//         if (transactionTypeId == -1) {
//           getEmployeeApprovalList(
//               empID: "",
//               fromDate: TimeConvert.toYYYYmmdd(
//                   DateTime.now().subtract(const Duration(days: 30)).toString()),
//               toDate: TimeConvert.toYYYYmmdd(DateTime.now().toString()));
//         } else if (transactionTypeId == 0) {
//           getGetApprovalItemByUser(
//               transectionId: approvalDetails.value.data?.transectionId,
//               transectionType: approvalDetails.value.data?.transectionType);
//         } else {
//           getApprovalListByTransactionId(
//               transactionTypeId: transactionTypeId,
//               fromDate: fromDateController.text,
//               toDate: toDateController.text);
//         }
//       }
//     });
//   }
//   // getNextAuthorityForEvent({transectionId,transectionType}){
//   //   ApiRequest apiRequest=ApiRequest(url: ApiPath.urlNextAuthorityForEvent+'EventId=${transectionId}&TransectionType=${transectionType}');
//   //   apiRequest.getRequestWithAuth().then((res) => {
//   //
//   //
//   //     if(res!.statusCode==200){
//   //    nextAuthorityForEventData.value = NextAuthorityForEventModel.fromJson(jsonDecode(res.body))  ;
//   //
//   //
//   //   nextAuthorityEventController.text=nextAuthorityForEventData.value.data?.transectionTypeName??''  ;
//   //   nextAuthorityEventNameController.text=nextAuthorityForEventData.value.data?.notifyUserName??'' ;
//   //
//   //
//   //     }
//   //
//   //
//   //   });
//   // }
//
//   @override
//   void onReady() {
//     super.onReady();
//     getEmployeeApprovalList(
//         empID: "",
//         fromDate: TimeConvert.toYYYYmmdd(
//             DateTime.now().subtract(Duration(days: 30)).toString()),
//         toDate: TimeConvert.toYYYYmmdd(DateTime.now().toString()));
//     getLeaveTypeList();
//     // getTransectionTypeListByUser();
//     // getApprovalListByTransctionTypeAndUser(fromDate: '2024-03-04', toDate: '2024-03-04');
//     getTransactionType();
//   }
// }
