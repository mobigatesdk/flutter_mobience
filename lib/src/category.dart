///In-app event class.
///In-App Events provide insight on what is happening in your app. It is recommended to take the time and define the events you would like to measure
class Category {
  final String _category;
  final List<Map<String, dynamic>> _parameters;

  Category._builder(CategoryBuilder builder)
      : _category = builder.category,
        _parameters = builder.parameters;

  List<Map<String, dynamic>> get parameters => _parameters;

  String get category => _category;

  Map<String, dynamic> toJson() =>
      {'category': _category, 'parameters': _parameters};
}

///Category builder
class CategoryBuilder {
  String _category;
  List<Map<String, dynamic>> _parameters;

  CategoryBuilder(this._category);

  get category => _category;

  get parameters => _parameters;

  void setParameter(String name, dynamic value) {
    if (_parameters == null) _parameters = [];
    _parameters.add({name: value});
  }

  Category build() {
    return Category._builder(this);
  }
}

class EventCategory {
  ///Track accomplished game level achievement
  static const LEVEL_ACCOMPLISHED = "LEVEL_ACCOMPLISHED";

  ///Track payment info
  static const ADD_PAYMENT_INFO = "ADD_PAYMENT_INFO";

  ///Track add item to basket
  static const ADD_TO_BASKET = "ADD_TO_BASKET";

  ///Track removed item from basket
  static const REMOVED_FROM_BASKET = "REMOVED_FROM_BASKET";

  ///Track add item to wish list
  static const ADD_TO_WISH_LIST = "ADD_TO_WISH_LIST";

  ///Track registration
  static const REGISTRATION = "REGISTRATION";

  ///Track tutorial completion
  static const TUTORIAL_COMPLETION = "TUTORIAL_COMPLETION";

  ///Track triggered checkout
  static const TRIGGER_CHECKOUT = "TRIGGER_CHECKOUT";

  ///Track purchased item
  static const PURCHASE = "PURCHASE";

  ///Track subscription purchase
  static const SUBSCRIBE = "SUBSCRIBE";

  ///Track begin trail of product
  static const BEGIN_TRIAL = "BEGIN_TRIAL";

  ///Track app/item rate
  static const RATE = "RATE";

  ///Track search event
  static const SEARCH = "SEARCH";

  ///Track use of credit
  static const USED_CREDIT = "USED_CREDIT";

  ///Track achievement unlock
  static const UNLOCKED_ACHIEVEMENT = "UNLOCKED_ACHIEVEMENT";

  ///Track content view event
  static const VIEW_CONTENT = "VIEW_CONTENT";

  ///Track list event
  static const VIEW_LIST = "VIEW_LIST";

  ///Track ad click
  static const CLICK_AD = "CLICK_AD";

  ///Track view ad
  static const VIEW_AD = "VIEW_AD";

  ///Track booking event
  static const EVENT_BOOKING = "EVENT_BOOKING";

  ///rack share event
  static const SHARE = "SHARE";

  ///Track social invite event
  static const INVITE = "INVITE";

  ///Track user login event
  static const LOGIN = "LOGIN";

  ///Track re engagement event
  static const EVENT_RETURN = "EVENT_RETURN";

  ///Track user opened push notification
  static const OPENED_PUSH_NOTIFICATION = "OPENED_PUSH_NOTIFICATION";

  ///Track update event
  static const UPDATE = "UPDATE";
}

class EventParameter {
  ///Recommended value double
  static const REVENUE = "REVENUE";

  ///Recommended value double
  static const PRICE = "PRICE";

  ///Recommended value int
  static const LEVEL = "LEVEL";

  ///Recommended value bool
  static const SUCCESS = "SUCCESS";

  ///Recommended value String
  static const CONTENT_TYPE = "CONTENT_TYPE";

  ///Recommended value list of strings
  static const CONTENT_LIST = "CONTENT_LIST";

  ///Recommended value String
  static const CONTENT_ID = "CONTENT_ID";

  ///Recommended value String
  static const CURRENCY = "CURRENCY";

  ///Recommended value String
  static const REGISTRATION_METHOD = "REGISTRATION_METHOD";

  ///Recommended value int
  static const QUANTITY = "QUANTITY";

  ///Recommended value bool
  static const PAYMENT_INFO_AVAILABLE = "PAYMENT_INFO_AVAILABLE";

  ///Recommended value double
  static const RATING_VALUE = "RATING_VALUE";

  ///Recommended value double
  static const MAX_RATING_VALUE = "MAX_RATING_VALUE";

  ///Recommended value String
  static const SEARCH_STRING = "SEARCH_STRING";

  ///Recommended value String
  static const DESCRIPTION = "DESCRIPTION";

  ///Recommended value int
  static const SCORE = "SCORE";

  ///Recommended valueString
  static const DESTINATION_A = "DESTINATION_A";

  ///Recommended value String
  static const DESTINATION_B = "DESTINATION_B";

  ///Recommended value String
  static const CLASS = "CLASS";

  ///Recommended value String
  static const DATE_A = "DATE_A";

  ///Recommended value String
  static const DATE_B = "DATE_B";

  ///Recommended value Unixtime
  static const EVENT_START = "EVENT_START";

  ///Recommended value Unixtime
  static const EVENT_END = "EVENT_END";

  ///Recommended value double
  static const LATITUDE = "LATITUDE";

  ///Recommended value double
  static const LONGITUDE = "LONGITUDE";

  ///Recommended value String
  static const CUSTOMER_USER_ID = "CUSTOMER_USER_ID";

  ///Recommended value String
  static const CUSTOMER_SEGMENT = "CUSTOMER_SEGMENT";

  ///Recommended value String
  static const VALIDATED = "VALIDATED";

  ///Recommended value String
  static const RECEIPT_ID = "RECEIPT_ID";

  ///Recommended value String
  static const ORDER_ID = "ORDER_ID";

  ///Recommended value String
  static const TUTORIAL_ID = "TUTORIAL_ID";

  ///Recommended value String
  static const ACHIEVEMENT_ID = "ACHIEVEMENT_ID";

  ///Recommended value String
  static const VIRTUAL_CURRENCY_NAME = "VIRTUAL_CURRENCY_NAME";

  ///Recommended value String
  static const DEEP_LINK = "DEEP_LINK";

  ///Recommended value String
  static const OLD_VERSION = "OLD_VERSION";

  ///Recommended value String
  static const NEW_VERSION = "NEW_VERSION";

  ///Recommended value String
  static const REVIEW_TEXT = "REVIEW_TEXT";

  ///Recommended value String
  static const COUPON_CODE = "COUPON_CODE";

  ///Recommended value String
  static const DEPARTING_DEPARTURE_DATE = "DEPARTING_DEPARTURE_DATE";

  ///Recommended value String
  static const RETURNING_DEPARTURE_DATE = "RETURNING_DEPARTURE_DATE";

  ///Recommended value list of strings
  static const DESTINATION_LIST = "DESTINATION_LIST";

  ///Recommended value String
  static const CITY = "CITY";

  ///Recommended value String
  static const REGION = "REGION";

  ///Recommended value String
  static const COUNTRY = "COUNTRY";

  ///Recommended value String
  static const DEPARTING_ARRIVAL_DATE = "DEPARTING_ARRIVAL_DATE";

  ///Recommended value String
  static const RETURNING_ARRIVAL_DATE = "RETURNING_ARRIVAL_DATE";

  ///Recommended value list of strings
  static const SUGGESTED_DESTINATIONS = "SUGGESTED_DESTINATIONS";

  ///Recommended value String
  static const TRAVEL_START = "TRAVEL_START";

  ///Recommended value String
  static const TRAVEL_END = "TRAVEL_END";

  ///Recommended value int
  static const NUM_ADULTS = "NUM_ADULTS";

  ///Recommended value int
  static const NUM_CHILDREN = "NUM_CHILDREN";

  ///Recommended value int
  static const NUM_INFANTS = "NUM_INFANTS";

  ///Recommended value list of strings
  static const SUGGESTED_HOTELS = "SUGGESTED_HOTELS";

  ///Recommended value double
  static const USER_SCORE = "USER_SCORE";

  ///Recommended value double
  static const HOTEL_SCORE = "HOTEL_SCORE";

  ///Recommended value String
  static const PURCHASE_CURRENCY = "PURCHASE_CURRENCY";

  ///Recommended value list of int with size == 2
  static const PREFERRED_STAR_RATINGS = "PREFERRED_STAR_RATINGS";

  ///Recommended value list of int with size == 2
  static const PREFERRED_PRICE_RANGE = "PREFERRED_PRICE_RANGE";

  ///Recommended value list of strings
  static const PREFERRED_NEIGHBORHOODS = "PREFERRED_NEIGHBORHOODS";

  ///Recommended value int
  static const PREFERRED_NUM_STOPS = "PREFERRED_NUM_STOPS";

  ///Recommended value String
  static const CONTENT = "CONTENT";

  ///Recommended value String
  static const PARAM_1 = "PARAM_1";

  ///Recommended value String
  static const PARAM_2 = "PARAM_2";

  ///Recommended value String
  static const PARAM_3 = "PARAM_3";

  ///Recommended value String
  static const PARAM_4 = "PARAM_4";

  ///Recommended value String
  static const PARAM_5 = "PARAM_5";

  ///Recommended value String
  static const PARAM_6 = "PARAM_6";

  ///Recommended value String
  static const PARAM_7 = "PARAM_7";

  ///Recommended value String
  static const PARAM_8 = "PARAM_8";

  ///Recommended value String
  static const PARAM_9 = "PARAM_9";

  ///Recommended value String
  static const PARAM_10 = "PARAM_10";
}
