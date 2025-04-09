import '../../generated/app_localizations.dart';
import '../services/navigator/app_navigation_service.dart';

/**
 * Created by Abdullah on 9/4/25.
 */

/// This function is used to get the localized string for a given key.


AppLocalizations get Localized  => AppLocalizations.of(AppNavigatorService.navigatorKey.currentContext!)!;
