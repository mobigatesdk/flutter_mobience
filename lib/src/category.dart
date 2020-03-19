class Category {
  final String _category;
  final List<Map<String,dynamic>> _parameters;

  Category._builder(CategoryBuilder builder) :
        _category = builder.category,
        _parameters = builder.parameters;

  List<Map<String, dynamic>> get parameters => _parameters;

  String get category => _category;

  Map<String, dynamic> toJson() => {
    'category' : _category,
    'parameters' : _parameters
  };

}

class CategoryBuilder{
  String _category;
  List<Map<String,dynamic>> _parameters;

  CategoryBuilder(this._category);

  get category => _category;

  get parameters => _parameters;

  void setParameter(String name, dynamic value){
    if(_parameters == null)
      _parameters = [];
    _parameters.add({name:value});
  }

  Category build(){
    return Category._builder(this);
  }
}

class EventCategory {
  static const LEVEL_ACCOMPLISHED = "LEVEL_ACCOMPLISHED";
  static const ADD_PAYMENT_INFO = "ADD_PAYMENT_INFO";
  static const ADD_TO_BASKET = "ADD_TO_BASKET";
  static const REMOVED_FROM_BASKET = "REMOVED_FROM_BASKET";
  static const ADD_TO_WISH_LIST = "ADD_TO_WISH_LIST";
  static const REGISTRATION = "REGISTRATION";
  static const TUTORIAL_COMPLETION = "TUTORIAL_COMPLETION";
  static const TRIGGER_CHECKOUT = "TRIGGER_CHECKOUT";
  static const PURCHASE = "PURCHASE";
  static const SUBSCRIBE = "SUBSCRIBE";
  static const BEGIN_TRIAL = "BEGIN_TRIAL";
  static const RATE = "RATE";
  static const SEARCH = "SEARCH";
  static const USED_CREDIT = "USED_CREDIT";
  static const UNLOCKED_ACHIEVEMENT = "UNLOCKED_ACHIEVEMENT";
  static const VIEW_CONTENT = "VIEW_CONTENT";
  static const VIEW_LIST = "VIEW_LIST";
  static const CLICK_AD = "CLICK_AD";
  static const VIEW_AD = "VIEW_AD";
  static const EVENT_BOOKING = "EVENT_BOOKING";
  static const SHARE = "SHARE";
  static const INVITE = "INVITE";
  static const LOGIN = "LOGIN";
  static const EVENT_RETURN = "EVENT_RETURN";
  static const OPENED_PUSH_NOTIFICATION = "OPENED_PUSH_NOTIFICATION";
  static const UPDATE = "UPDATE";
}

class EventParameter {
  static const REVENUE = "REVENUE";
  static const PRICE = "PRICE";
  static const LEVEL = "LEVEL";
  static const SUCCESS = "SUCCESS";
  static const CONTENT_TYPE = "CONTENT_TYPE";
  static const CONTENT_LIST = "CONTENT_LIST";
  static const CONTENT_ID = "CONTENT_ID";
  static const CURRENCY = "CURRENCY";
  static const REGISTRATION_METHOD = "REGISTRATION_METHOD";
  static const QUANTITY = "QUANTITY";
  static const PAYMENT_INFO_AVAILABLE = "PAYMENT_INFO_AVAILABLE";
  static const RATING_VALUE = "RATING_VALUE";
  static const MAX_RATING_VALUE = "MAX_RATING_VALUE";
  static const SEARCH_STRING = "SEARCH_STRING";
  static const DESCRIPTION = "DESCRIPTION";
  static const SCORE = "SCORE";
  static const DESTINATION_A = "DESTINATION_A";
  static const DESTINATION_B = "DESTINATION_B";
  static const CLASS = "CLASS";
  static const DATE_A = "DATE_A";
  static const DATE_B = "DATE_B";
  static const EVENT_START = "EVENT_START";
  static const EVENT_END = "EVENT_END";
  static const LATITUDE = "LATITUDE";
  static const LONGITUDE = "LONGITUDE";
  static const CUSTOMER_USER_ID = "CUSTOMER_USER_ID";
  static const CUSTOMER_SEGMENT = "CUSTOMER_SEGMENT";
  static const VALIDATED = "VALIDATED";
  static const RECEIPT_ID = "RECEIPT_ID";
  static const ORDER_ID = "ORDER_ID";
  static const TUTORIAL_ID = "TUTORIAL_ID";
  static const ACHIEVEMENT_ID = "ACHIEVEMENT_ID";
  static const VIRTUAL_CURRENCY_NAME = "VIRTUAL_CURRENCY_NAME";
  static const DEEP_LINK = "DEEP_LINK";
  static const OLD_VERSION = "OLD_VERSION";
  static const NEW_VERSION = "NEW_VERSION";
  static const REVIEW_TEXT = "REVIEW_TEXT";
  static const COUPON_CODE = "COUPON_CODE";
  static const DEPARTING_DEPARTURE_DATE = "DEPARTING_DEPARTURE_DATE";
  static const RETURNING_DEPARTURE_DATE = "RETURNING_DEPARTURE_DATE";
  static const DESTINATION_LIST = "DESTINATION_LIST";
  static const CITY = "CITY";
  static const REGION = "REGION";
  static const COUNTRY = "COUNTRY";
  static const DEPARTING_ARRIVAL_DATE = "DEPARTING_ARRIVAL_DATE";
  static const RETURNING_ARRIVAL_DATE = "RETURNING_ARRIVAL_DATE";
  static const SUGGESTED_DESTINATIONS = "SUGGESTED_DESTINATIONS";
  static const TRAVEL_START = "TRAVEL_START";
  static const TRAVEL_END = "TRAVEL_END";
  static const NUM_ADULTS = "NUM_ADULTS";
  static const NUM_CHILDREN = "NUM_CHILDREN";
  static const NUM_INFANTS = "NUM_INFANTS";
  static const SUGGESTED_HOTELS = "SUGGESTED_HOTELS";
  static const USER_SCORE = "USER_SCORE";
  static const HOTEL_SCORE = "HOTEL_SCORE";
  static const PURCHASE_CURRENCY = "PURCHASE_CURRENCY";
  static const PREFERRED_STAR_RATINGS = "PREFERRED_STAR_RATINGS";
  static const PREFERRED_PRICE_RANGE = "PREFERRED_PRICE_RANGE";
  static const PREFERRED_NEIGHBORHOODS = "PREFERRED_NEIGHBORHOODS";
  static const PREFERRED_NUM_STOPS = "PREFERRED_NUM_STOPS";
  static const CONTENT = "CONTENT";
  static const PARAM_1 = "PARAM_1";
  static const PARAM_2 = "PARAM_2";
  static const PARAM_3 = "PARAM_3";
  static const PARAM_4 = "PARAM_4";
  static const PARAM_5 = "PARAM_5";
  static const PARAM_6 = "PARAM_6";
  static const PARAM_7 = "PARAM_7";
  static const PARAM_8 = "PARAM_8";
  static const PARAM_9 = "PARAM_9";
  static const PARAM_10 = "PARAM_10";

}