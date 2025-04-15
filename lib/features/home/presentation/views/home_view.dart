import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../chat/presentation/views/master_chat_view.dart';
import '../../../favorite/presentation/views/favorite_view.dart';
import '../../../search/presentation/views/search_view.dart';
import '../widgets/custom_home_app_bar.dart';
import '../widgets/custom_home_bottom_navigation_bar.dart';
import '../widgets/custom_home_brands_section.dart';
import '../widgets/custom_home_drawer.dart';
import '../widgets/custom_home_page_recommendation_services_card.dart';
import '../widgets/custom_home_search_bar.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (currentIndex != index) {
      setState(() {
        currentIndex = index;
      });
      _controller.jumpToPage(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: Colors.white,
        width: 280.w,
        child: CustomHomeDrawer(scaffoldKey: _scaffoldKey),
      ),
      bottomNavigationBar: CustomHomeBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onItemTapped,
      ),
      backgroundColor: AppColors.kMainBackgroundColor,
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          if (currentIndex != index) {
            setState(() {
              currentIndex = index;
            });
          }
        },
        children: [
          MainHomeView(onSearchPressed: () => _onItemTapped(1)),
          const SearchView(),
          const FavoriteView(),
          const MasterChatView(),
        ],
      ),
    );
  }
}

class MainHomeView extends StatelessWidget {
  final VoidCallback onSearchPressed;

  const MainHomeView({super.key, required this.onSearchPressed});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomHomeAppBar(),
          verticalSpace(10),
          CustomHomeSearchBar(
            scaffoldKey: _scaffoldKey,
            onSearchPressed: onSearchPressed,
          ),
          verticalSpace(16),
          const CustomHomeBrandsSection(),
          const CustomHomePageRecommendationServicesCard(),
        ],
      ),
    );
  }
}
