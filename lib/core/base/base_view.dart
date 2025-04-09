import 'package:flutter/material.dart';
import 'package:flutter_mvvm_prac_1_eu/core/base/base_page_state.dart';
import 'package:flutter_mvvm_prac_1_eu/core/base/base_view_model.dart';
import 'package:flutter_mvvm_prac_1_eu/core/di/injection.dart';
import 'package:flutter_mvvm_prac_1_eu/core/widgets/loader/app_loader.dart';
import 'package:go_router/go_router.dart';

/**
 * Created by Abdullah on 8/4/25.
 */

abstract class BaseView<B extends BaseViewModel> extends StatelessWidget {
  B viewModel = Injector.resolve<B>();

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  late BuildContext context;

  BaseView({super.key});



  @override
  Widget build(BuildContext context) {
    this.context = context;
    viewModel.currentPath = GoRouterState.of(context).path!;
    return wrapScaffold(body(context));
  }

  Widget body(BuildContext context);

  Widget _getPageContent() {
    return Padding(
      padding: setPadding(),
      child: body(context),
    );
  }

  PreferredSizeWidget? appBar() {}

  Widget? floatingActionButton() {
    return null;
  }

  FloatingActionButtonLocation? floatingActionButtonLocation() {
    return null;
  }

  wrapScaffold(Widget body) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      key: globalKey,
      extendBodyBehindAppBar: true,
      appBar: appBar(),
      floatingActionButton: floatingActionButton(),
      floatingActionButtonLocation: floatingActionButtonLocation(),
      body: Stack(
        children: [
          SafeArea(child: _getPageContent()),
          ValueListenableBuilder<PageState>(
            valueListenable: viewModel.pageSateController,
            builder: (context, pageState, _) {
              return pageState == PageState.LOADING
                  ? _showLoader()
                  : const SizedBox();
            },
          ),
        ],
      ),
    );
  }

  Widget _showLoader() {
    return const AppLoader();
  }

  EdgeInsets setPadding() {
    return const EdgeInsets.all(8);
  }
}
