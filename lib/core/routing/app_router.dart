import 'package:flutter_mvvm_prac_1_eu/core/routing/route_list.dart';
import 'package:flutter_mvvm_prac_1_eu/core/routing/route_path.dart';
import 'package:flutter_mvvm_prac_1_eu/core/services/navigator/app_navigation_service.dart';
import 'package:go_router/go_router.dart';

/**
 * Created by Abdullah on 8/4/25.
 */

final router =  GoRouter(
  routes: AppRoutesList.allRoutes(),
  navigatorKey: AppNavigatorService.navigatorKey,
  initialLocation: RoutePath.start,
);

