/**
 * Created by Abdullah on 8/4/25.
 */

abstract class RoutePath{
  static const String start = _RoutePath._start;
  static const String dashboard = _RoutePath._dashboard;
  static const String productDetails = _RoutePath._productDetails;
  static const String settings = _RoutePath._settings;

}
class _RoutePath{
  static const String _start = '/';
  static const String _dashboard = '/dashboard';
  static const String _productDetails = '/productDetails';
  static const String _settings = '/settings';
}