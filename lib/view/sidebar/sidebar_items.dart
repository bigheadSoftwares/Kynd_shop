part of 'sidebar.dart';

class SidebarItems {
  String name;
  String asset;
  String route;
  SidebarItems({
    required this.name,
    required this.asset,
    required this.route,
  });
}

List<SidebarItems> _sidebarItems = <SidebarItems>[
  SidebarItems(
    name: 'Home',
    asset: Assets.home,
    route: Routes.home,
  ),
  SidebarItems(
    name: 'About Us',
    asset: Assets.aboutUs,
    route: Routes.aboutUs,
  ),
  SidebarItems(
    name: 'My Orders',
    asset: Assets.myOrders,
    route: Routes.myOrders,
  ),
  SidebarItems(
    name: 'Wishlist',
    asset: Assets.wishList,
    route: Routes.wishlist,
  ),
  SidebarItems(
    name: 'Refer & Earn',
    asset: Assets.referAndEarn,
    route: Routes.home,
  ),
  SidebarItems(
    name: 'My Address',
    asset: Assets.myAddress,
    route: Routes.home,
  ),
  SidebarItems(
    name: 'Feedback',
    asset: Assets.feedback,
    route: Routes.home,
  ),
  SidebarItems(
    name: 'Costumer Care',
    asset: Assets.costumerCare,
    route: Routes.support,
  ),
  SidebarItems(
    name: 'Share App',
    asset: Assets.share,
    route: Routes.home,
  ),
  SidebarItems(
    name: 'Terms & Condition',
    asset: Assets.termsAndCondition,
    route: Routes.termsAndCondition,
  ),
  SidebarItems(
    name: 'Logout',
    asset: Assets.logout,
    route: Routes.home,
  ),
];
