import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'E-commerce';

  @override
  String get products => 'Products';

  @override
  String get cart => 'Cart';

  @override
  String get addToCart => 'Add to Cart';

  @override
  String get description => 'Description';

  @override
  String get noProducts => 'No products available';

  @override
  String get addedToCart => 'Added to cart!';

  @override
  String get refresh => 'Refresh';

  @override
  String get settings => 'Settings';
}
