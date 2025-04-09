import 'package:flutter/material.dart';
import 'package:flutter_mvvm_prac_1_eu/core/base/base_page_state.dart';
import 'package:flutter_mvvm_prac_1_eu/core/network/exceptions/app_exception.dart';
import 'package:flutter_mvvm_prac_1_eu/core/utils/custom_dialog.dart';

/**
 * Created by Abdullah on 8/4/25.
 */


class BaseViewModel {

  var currentPath = "";
  ValueNotifier<PageState> pageSateController =
  ValueNotifier(PageState.DEFAULT);


  updatePageState(PageState state) => pageSateController.value = state;

  resetPageState() => pageSateController.value = PageState.DEFAULT;

  showLoader() => updatePageState(PageState.LOADING);

  hideLoader() => resetPageState();


  dynamic callService<T>(
      Future<T> future, {
        Function(Exception exception)? onError,
        Function(T response)? onSuccess,
        Function? onStart,
        Function? onComplete,
        bool isShowLoader = true,
        bool willShowError = true,
        bool isShowToast = true,
      }) async {
    Exception? _exception;
    onStart?.call();

    if (isShowLoader) {
      showLoader();
    }

    try {
      final T response = await future;
      if (onSuccess != null) onSuccess(response);
      onComplete == null ? hideLoader() : onComplete();


      return response;

    } catch (error) {
      if (isShowLoader) {
        hideLoader();
      }
      _exception = AppException(message: "$error");
      debugPrint("::: Call Service Exception ::: ${error}");
    }

    if (onError != null) onError(_exception);

    if (onComplete != null) onComplete();
  }

  showErrorMessage(String message , {bool isToast = false , bool willShowError = true}){
    if(willShowError){
      if(isToast){
        showCustomDialog(message);
      }else{
        showCustomDialog(message);
      }
    }
  }

}