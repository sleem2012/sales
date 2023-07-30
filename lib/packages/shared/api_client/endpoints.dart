import 'dart:io';
import '../../../main.dart';

abstract class KEndPoints {
  static String baseUrl = test ? 'https://forallfa.org/' : 'https://forall.sa/';
  static String socket = test ? 'https://forallfa.org:86' : 'https://forall.sa:85';

  static String lang = '${baseUrl}setting/api/languages';
  static String settings = '${baseUrl}setting/api/settings';
  static String countries = '${baseUrl}setting/api/countries';
  static String cities = '${baseUrl}setting/api/cities';
  static String addresses = '${baseUrl}setting/api/addresses';
  static String currencies = '${baseUrl}setting/api/currencies';
  static String company_system_create = '${baseUrl}company/api/company_system';
  static String register = '${baseUrl}auth/api/registration';
  static String forget_pass = '${baseUrl}auth/api/forget-password';
  static String login = '${baseUrl}auth/api/login';
  static String logout = '${baseUrl}auth/api/logout';
  static String verify_token = '${baseUrl}auth/api/verify-token';
  static String reset_pass = '${baseUrl}auth/api/reset-password';
  static String update_user = '${baseUrl}auth/api/system_user';
  static String change_pass = '${baseUrl}auth/api/change-password';
  static String user_info = '${baseUrl}auth/api/my-info';
  static String payment_type = '${baseUrl}setting/api/payment_types';
  static String add_payment = '${baseUrl}auth/api/payment_information';
  static String my_payment = '${baseUrl}auth/api/payment_information';
  static String get_banks = '${baseUrl}auth/api/banks';
  static String company_type = '${baseUrl}company/api/company_type';
  static String company_read = '${baseUrl}company/api/company_system';
  static String assign = '${baseUrl}company/api/assigned_or_accept';
  static String company_package_read = '${baseUrl}company/api/company_package';
  static String branch_read = '${baseUrl}company/api/company_branch';
  static String branch_staff = '${baseUrl}company/api/company_branch_staff';
  static String notifications = '${baseUrl}auth/api/notification';
  static String company_system = '${baseUrl}company/api/company_system';
  static String getCategories = '${baseUrl}company/api/categories';
  static String sales_delegate = '${baseUrl}services/api/hr/sales_delegate_company';
  static String getProducts = '${baseUrl}company/api/product_system';
  static String getHotelsProducts = '${baseUrl}company/api/read_products';
  static String product_colors = '${baseUrl}services/api/product/colors';
  static String favourite = '${baseUrl}company/api/product_favourite';
  static String reviews = '${baseUrl}company/api/product_review';
  static String cart = '${baseUrl}company/api/product_cart';
  static String my_commission = '${baseUrl}auth/api/sales_commissions';
  static String checkout = '${baseUrl}company/api/product_checkout';
  static String extraCart = '${baseUrl}company/api/product_cart_extra';
  static String schedule = '${baseUrl}company/api/schedule';
  static String chat_messages = '${baseUrl}vendor/api/chat_room_member_message';
  static String chat_members = '${baseUrl}vendor/api/chat_room_member';
  static String chat_room = '${baseUrl}vendor/api/chat_room';
  static String upload_file = '${baseUrl}company/api/upload_chat_file';
  static String myCv = '${baseUrl}company/api/applier_cv';
  static String job_applier = '${baseUrl}company/api/job_applier';
  static String get_jobs = '${baseUrl}company/api/company_job';
  static String orders = '${baseUrl}auth/api/orders';
  static String status = '${baseUrl}auth/api/orders_status';
  static String orderReview = '${baseUrl}auth/api/orders_reviews';
  static String deliveringOrder = '${baseUrl}auth/api/orders_bill';
  static String handlePayment = '${baseUrl}auth/api/orders_bill/payment_handel';
  static String inDrivePayment = '${baseUrl}auth/api/book_trips/payment_handel';
  static String create_report_step1 = '${baseUrl}report/api/info';
  static String history = '${baseUrl}auth/api/payment_history';
  static String in_drive = '${baseUrl}auth/api/book_trips';
  static String in_drive_calculate = '${baseUrl}auth/api/book_trips_calculate';
  static String rate_trip = '${baseUrl}auth/api/book_trips/rate';
  static String productMenu = '${baseUrl}company/api/product_menu';
  static String search = '${baseUrl}vendor/api/search';
  static String get_category_attr_fields = '${baseUrl}company/api/attribute_category';
  static String company_by_category = 'https://forallfa.org/company/api/by_category';
  static String request_for_quote = "${baseUrl}company/api/company_request_quote";
  static String company_renew = '${baseUrl}company/api/company_renew';
  static String get_company_fields = '${baseUrl}company/api/company_attributes';
  static String create_company_dui = '${baseUrl}company/api/company_system';
  static String system_user = '${baseUrl}auth/api/system_user';
  static String categories = '${baseUrl}company/api/categories';
  static String add_product = '${baseUrl}company/api/product_system';
  static String product_sizes = '${baseUrl}services/api/product/sizes';
  static String extra = '${baseUrl}company/api/product_extra';
  static String get_pro_product_menu_fields = '${baseUrl}company/api/product_required_fields';
  static String get_pro_attr_fields = '${baseUrl}company/api/attribute_category';
  static String product_details = '${baseUrl}company/api/product_menu';
  static String add_pro_attr = '${baseUrl}company/api/product_attr';
  static String skills = '${baseUrl}company/api/company_job_category_skills';
  static String jobCategory = '${baseUrl}company/api/company_job_category';
  static String add_job = '${baseUrl}company/api/company_job';
  static String add_schedule = '${baseUrl}company/api/schedule';
  static String pro_menu_inventory = '${baseUrl}company/api/product_inventory';
  static String create_report_step2 = '${baseUrl}report/api/report_answer';
  static String get_report_categories = '${baseUrl}report/api/categories';
  static String branch_man = '${baseUrl}company/api/company_branch_manager';
  static String gat_cats = '${baseUrl}company/api/company_categories';
  static String get_delivery_attributes = '${baseUrl}company/api/delivery_attributes';
  static String add_delivery_attributes = '${baseUrl}services/api/forall/delivery';
  static String update_date = '${baseUrl}services/api/forall/delivery';
  static String commission = '${baseUrl}auth/api/sales_commissions';
  static String internal_employee = '${baseUrl}company/api/internal_employee';
  static String internal_employee_fields = '${baseUrl}company/api/employee_attributes';
  static String famous_attribute = '${baseUrl}company/api/famous_attribute';
  static String preFamous = '${baseUrl}company/api/famous/pre_registered';
  static String famous = '${baseUrl}company/api/famous';
  static String pendingApplication = '${baseUrl}company/api/internal_employee';
  static String famousTypes = '${baseUrl}company/api/famous_types';

  static String appStoreLinkVendor =
      Platform.isAndroid ? 'https://play.google.com/store/apps/details?id=com.easyindex.favendor' : 'https://apps.apple.com/us/app/forall/id1592120593';

  static String appStoreLinkSales =
      Platform.isAndroid ? 'https://play.google.com/store/apps/details?id=com.forall.forallhr' : 'https://apps.apple.com/us/app/forall-sales/id1607065808';

  static String appStoreLinkClient =
      Platform.isAndroid ? 'https://play.google.com/store/apps/details?id=com.easyindex.forall2030' : 'https://apps.apple.com/us/app/forall/id1592120593';

  static String appStoreLinkDriver = Platform.isAndroid
      ? 'https://play.google.com/store/apps/details?id=com.easyindex.forallcap2030'
      : 'https://apps.apple.com/us/app/forall-driver/id1600042031';

  static String devStoreLink = Platform.isAndroid
      ? "https://play.google.com/store/apps/dev?id=7695761114305611998"
      : "https://apps.apple.com/us/developer/forall-digital-marketing-company/id1592120595";

  static String get appsStoreLink => appName.when(
        sales: () => appStoreLinkSales,
        vendor: () => appStoreLinkVendor,
        client: () => appStoreLinkClient,
        delivery: () => appStoreLinkDriver,
      );

  static int get appVersion => appName.when(
        sales: () => 11,
        vendor: () => 9,
        client: () => 6,
        delivery: () => 4,
      );
}
