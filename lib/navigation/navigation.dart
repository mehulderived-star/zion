import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:zion_app/screens/Auth/verificationScreen/verificationScreenController.dart';
import 'package:zion_app/screens/MainTab/DiscoverTab/DiscoverScreenController.dart';
import 'package:zion_app/screens/MainTab/DiscoverTab/DiscoverScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/HomeTab/RefineYourQuoteScreen/RefindYourQuoteScreenController.dart';
import 'package:zion_app/screens/MainTab/HomeTab/RefineYourQuoteScreen/RefineYourQuoteScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/OrderTab/OrderScreenController.dart';
import 'package:zion_app/screens/MainTab/ProfileTab/CardsScreen/CardsScreenController.dart';
import 'package:zion_app/screens/MainTab/ProfileTab/CardsScreen/CardsScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/ProfileTab/ConsolidationScreen/ConsolidationScreenController.dart';
import 'package:zion_app/screens/MainTab/ProfileTab/ConsolidationScreen/ConsolidationScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/ProfileTab/EditProfileScreen/EditProfileScreenController.dart';
import 'package:zion_app/screens/MainTab/ProfileTab/EditProfileScreen/EditProfileScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/ProfileTab/LanguageScreen/LanguageScreenController.dart';
import 'package:zion_app/screens/MainTab/ProfileTab/LanguageScreen/LanguageScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/ProfileTab/MyConsigneesScreen/MyConsigneesScreenController.dart';
import 'package:zion_app/screens/MainTab/ProfileTab/MyConsigneesScreen/MyConsigneesScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/ProfileTab/PlansScreen/PlansScreenController.dart';
import 'package:zion_app/screens/MainTab/ProfileTab/PlansScreen/PlansScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/ProfileTab/ProfileScreenController.dart';
import 'package:zion_app/screens/MainTab/ProfileTab/SecurityScreen/SecurityScreenController.dart';
import 'package:zion_app/screens/MainTab/ProfileTab/SecurityScreen/SecurityScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/ProfileTab/ShipmentHistoryScreen/ShipmentHistoryScreenController.dart';
import 'package:zion_app/screens/MainTab/ProfileTab/ShipmentHistoryScreen/ShipmentHistoryScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/ProfileTab/SubscriptionScreen/SubscriptionScreenController.dart';
import 'package:zion_app/screens/MainTab/ProfileTab/SubscriptionScreen/SubscriptionScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/SideMenu/BecomeAnAgentScreen/BecomeAnAgentScreenController.dart';
import 'package:zion_app/screens/MainTab/SideMenu/BecomeAnAgentScreen/BecomeAnAgentScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/SideMenu/FAQScreen/FAQScreenController.dart';
import 'package:zion_app/screens/MainTab/SideMenu/FAQScreen/FAQScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/SideMenu/GetAQuoteScreen/GetAQuoteScreenController.dart';
import 'package:zion_app/screens/MainTab/SideMenu/GetAQuoteScreen/GetAQuoteScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/SideMenu/GetAQuoteScreen/ShipmentSuccessfullScreen/ShipmentSuccessfullController.dart';
import 'package:zion_app/screens/MainTab/SideMenu/GetAQuoteScreen/ShipmentSuccessfullScreen/ShipmentSuccessfullWrapper.dart';
import 'package:zion_app/screens/MainTab/SideMenu/HelpAndSupportScreen/AddTicketScreen/AddTicketScreenController.dart';
import 'package:zion_app/screens/MainTab/SideMenu/HelpAndSupportScreen/AddTicketScreen/AddTicketScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/SideMenu/HelpAndSupportScreen/ContactUsScreen/ContactUsScreenController.dart';
import 'package:zion_app/screens/MainTab/SideMenu/HelpAndSupportScreen/ContactUsScreen/ContactUsScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/SideMenu/HelpAndSupportScreen/FileAClaimScreen/FileAClaimScreenController.dart';
import 'package:zion_app/screens/MainTab/SideMenu/HelpAndSupportScreen/FileAClaimScreen/FileAClaimScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/SideMenu/HelpAndSupportScreen/HelpAndSupportScreenController.dart';
import 'package:zion_app/screens/MainTab/SideMenu/HelpAndSupportScreen/HelpAndSupportScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/SideMenu/OrderSuppliesScreen/CheckOutScreen/CheckOutScreenController.dart';
import 'package:zion_app/screens/MainTab/SideMenu/OrderSuppliesScreen/CheckOutScreen/CheckOutScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/SideMenu/OrderSuppliesScreen/OrderSuppliesCategoryScreenController.dart';
import 'package:zion_app/screens/MainTab/SideMenu/OrderSuppliesScreen/OrderSuppliesCategoryScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/SideMenu/OrderSuppliesScreen/OrderSuppliesProductDetailScreen/OrderSuppliesProductDetailScreenController.dart';
import 'package:zion_app/screens/MainTab/SideMenu/OrderSuppliesScreen/OrderSuppliesProductDetailScreen/OrderSuppliesProductDetailScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/SideMenu/OrderSuppliesScreen/OrderSuppliesProductScreen/OrderSuppliesProductScreenController.dart';
import 'package:zion_app/screens/MainTab/SideMenu/OrderSuppliesScreen/OrderSuppliesProductScreen/OrderSuppliesProductScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/SideMenu/OrderSuppliesScreen/PaymentScreen/PaymentScreenController.dart';
import 'package:zion_app/screens/MainTab/SideMenu/OrderSuppliesScreen/PaymentScreen/PaymentScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/SideMenu/OrderSuppliesScreen/PaymentSuccesfullScreen/PaymentSuccessfullScreenController.dart';
import 'package:zion_app/screens/MainTab/SideMenu/OrderSuppliesScreen/PaymentSuccesfullScreen/PaymentSuccessfullScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/SideMenu/OurLocationScreen/MapScreen/MapScreenController.dart';
import 'package:zion_app/screens/MainTab/SideMenu/OurLocationScreen/MapScreen/MapScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/SideMenu/OurLocationScreen/OurLocationScreenController.dart';
import 'package:zion_app/screens/MainTab/SideMenu/OurLocationScreen/OurLocationScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/SideMenu/SideMenuController.dart';
import 'package:zion_app/screens/MainTab/SideMenu/SideMenuWrapper.dart';
import 'package:zion_app/screens/MainTab/SideMenu/TrackPackageScreen/TrackPackageScreenController.dart';
import 'package:zion_app/screens/MainTab/SideMenu/TrackPackageScreen/TrackPackageScreenWrapper.dart';
import 'package:zion_app/screens/MainTab/SideMenu/WhereWeShipScreen/WhereWeShipScreenController.dart';
import 'package:zion_app/screens/MainTab/SideMenu/WhereWeShipScreen/WhereWeShipScreenWrapper.dart';

import '../screens/Auth/signInScreen/signInScreenController.dart';
import '../screens/Auth/signInScreen/signInScreenWrapper.dart';
import '../screens/Auth/verificationScreen/verificationScreenWrapper.dart';
import '../screens/MainTab/HomeTab/HomeScreenController.dart';
import '../screens/MainTab/HomeTab/HomeScreenWrapper.dart';
import '../screens/MainTab/OrderTab/OrderScreenWrapper.dart';
import '../screens/MainTab/ProfileTab/ProfileScreenWrapper.dart';
import '../screens/MainTab/TabScreen/MainTabController.dart';
import '../screens/MainTab/TabScreen/MainTabWrapper.dart';
import 'routename.dart';

class Pages {
  static List<GetPage> pages() {
    return [
      GetPage(
        name: RouterName.signInScreen,
        page: () => const SignInScreen(),
        binding: SignInScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.verificationScreen,
        page: () => const VerificationScreen(),
        binding: VerificationScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.mainTab,
        page: () => const MainTab(),
        binding: MainTabBinding(),
      ),
      GetPage(
        name: RouterName.homeScreen,
        page: () => const HomeScreen(),
        binding: HomeScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.discoverScreen,
        page: () => const DiscoverScreen(),
        binding: DiscoverScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.orderScreen,
        page: () => const OrderScreen(),
        binding: OrderScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.profileScreen,
        page: () => const ProfileScreen(),
        binding: ProfileScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.sladderScreen,
        page: () => const SladderScreen(),
        binding: SladderScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.refineYourQuoteScreen,
        page: () => const RefineYourQuoteScreen(),
        binding: RefineYourQuoteScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.getAQuoteScreen,
        page: () => const GetAQuoteScreen(),
        binding: GetAQuoteScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.shipmentSuccessfullScreen,
        page: () => const ShipmentSuccessfullScreen(),
        binding: ShipmentSuccessfullScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.trackPackageScreen,
        page: () => const TrackPackageScreen(),
        binding: TrackPackageScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.becomeAnAgentScreen,
        page: () => const BecomeAnAgentScreen(),
        binding: BecomeAnAgentScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.editProfileScreen,
        page: () => const EditProfileScreen(),
        binding: EditProfileScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.securityScreen,
        page: () => const SecurityScreen(),
        binding: SecurityScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.languageScreen,
        page: () => const LanguageScreen(),
        binding: LanguageScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.myConsigneesScreen,
        page: () => const MyConsigneesScreen(),
        binding: MyConsigneesScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.consolidation,
        page: () => const ConsolidationScreen(),
        binding: ConsolidationScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.shipmentHistory,
        page: () => const ShipmentHistoryScreen(),
        binding: ShipmentHistoryScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.plansScreen,
        page: () => const PlansScreen(),
        binding: PlansScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.subscriptionScreen,
        page: () => const SubscriptionScreen(),
        binding: SubscriptionScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.cardsScreen,
        page: () => const CardsScreen(),
        binding: CardsScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.helpAndSupportScreen,
        page: () => const HelpAndSupportScreen(),
        binding: HelpAndSupportScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.addTicketScreen,
        page: () => const AddTicketScreen(),
        binding: AddTicketScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.fileAClaimScreen,
        page: () => const FileAClaimScreen(),
        binding: FileAClaimScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.contactUsScreen,
        page: () => const ContactUsScreen(),
        binding: ContactUsScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.orderSuppliesCategoryScreen,
        page: () => const OrderSuppliesCategoryScreen(),
        binding: OrderSuppliesCategoryControllerBinding(),
      ),
      GetPage(
        name: RouterName.orderSuppliesProductScreen,
        page: () => const OrderSuppliesProductScreen(),
        binding: OrderSuppliesProductControllerBinding(),
      ),
      GetPage(
        name: RouterName.orderSuppliesProductDetailScreen,
        page: () => const OrderSuppliesProductDetailScreen(),
        binding: OrderSuppliesProductDetailControllerBinding(),
      ),
      GetPage(
        name: RouterName.checkOutScreen,
        page: () => const CheckOutScreen(),
        binding: CheckOutScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.paymentScreen,
        page: () => const PaymentScreen(),
        binding: PaymentScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.paymentSuccessfullScreen,
        page: () => const PaymentSuccessfullScreen(),
        binding: PaymentSuccessfullScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.ourLocationScreen,
        page: () => const OurLocationScreen(),
        binding: OurLocationScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.faqScreen,
        page: () => const FAQScreen(),
        binding: FAQScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.whereWeShipScreen,
        page: () => const WhereWeShipScreen(),
        binding: WhereWeShipScreenControllerBinding(),
      ),
      GetPage(
        name: RouterName.mapScreen,
        page: () => const MapScreen(),
        binding: MapScreenControllerBinding(),
      ),
    ];
  }
}
