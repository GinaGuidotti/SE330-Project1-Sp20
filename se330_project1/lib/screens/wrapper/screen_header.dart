abstract class ScreenHeader {
  final String headerText;
  ScreenHeader() : headerText = 'Just Clicked Cameras';
}

class DefaultHeader extends ScreenHeader {
  final String headerText = 'Just Clicked Cameras';
  DefaultHeader();
}

class HomePageHeader extends ScreenHeader {
  final String headerText = 'Just Clicked Cameras';
  HomePageHeader();
}


class ShoppingHeader extends ScreenHeader {
  final String headerText = 'Shopping';
  ShoppingHeader();
}

class ReviewHeader extends ScreenHeader {
  final String headerText = 'Review';
  ReviewHeader();
}

class SavedHeader extends ScreenHeader {
  final String headerText = 'Saved';
  SavedHeader();
}

class FavoritesHeader extends ScreenHeader {
  final String headerText = 'Favorites';
  FavoritesHeader();
}

class AboutUsHeader extends ScreenHeader {
  final String headerText = 'About Us';
  AboutUsHeader();
}
 
 