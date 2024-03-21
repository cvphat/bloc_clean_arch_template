import 'package:auto_route/auto_route.dart';

class RouteGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // TODO: check something
    resolver.next(true);
  }
}
