import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_grid_view_loading.dart';
import '../../../../core/widgets/no_cars_available.dart';
import '../../../home/presentation/widgets/custom_home_app_bar.dart';
import '../../data/models/search_cars_model.dart';
import '../../manager/search_cars_cubit.dart';
import '../../manager/search_cars_state.dart';
import '../widgets/custom_main_search_bar.dart';
import '../widgets/custom_search_brand_list.dart';
import '../widgets/custom_search_grid_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<SearchCarsModel> allCars = [];
  List<SearchCarsModel> searchedCars = [];
  String currentBrandFilter = '';
  String searchQuery = '';
  bool isLoading = false;
  bool isInitialLoad = true;

  @override
  void initState() {
    super.initState();
    _loadCars();
  }

  void _loadCars() {
    context.read<SearchCarsCubit>().loadAllCars();
  }

  void _updateState({
    List<SearchCarsModel>? cars,
    bool? loading,
    bool? initialLoad,
  }) {
    setState(() {
      if (cars != null) {
        allCars = cars;
        searchedCars = cars;
      }
      if (loading != null) isLoading = loading;
      if (initialLoad != null) isInitialLoad = initialLoad;
    });
  }

  void _filterCars() {
    setState(() {
      searchedCars =
          allCars.where((car) {
            final matchesBrand =
                currentBrandFilter.isEmpty ||
                (car.carName?.toLowerCase().contains(
                      currentBrandFilter.toLowerCase(),
                    ) ??
                    false);
            final matchesSearch =
                searchQuery.isEmpty ||
                (car.carName?.toLowerCase().contains(
                      searchQuery.toLowerCase(),
                    ) ??
                    false);
            return matchesBrand && matchesSearch;
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kMainBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const CustomHomeAppBar(),
            Expanded(
              child: BlocConsumer<
                SearchCarsCubit,
                SearchCarsState<List<SearchCarsModel>>
              >(
                listener: (context, state) {
                  state.when(
                    success:
                        (cars) => _updateState(
                          cars: cars,
                          loading: false,
                          initialLoad: false,
                        ),
                    error:
                        (_) => _updateState(loading: false, initialLoad: false),
                    loading: () => _updateState(loading: true),
                    idle: () => _updateState(loading: false),
                  );
                },
                builder: (context, state) {
                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: CustomMainSearchBar(
                          onSearchChanged: (searchText) {
                            searchQuery = searchText;
                            _filterCars();
                          },
                          onClearSearch: () {
                            searchQuery = '';
                            _filterCars();
                          },
                        ),
                      ),
                      SliverToBoxAdapter(child: verticalSpace(22)),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 40.h,
                          child: CustomSearchBrandList(
                            onBrandSelected: (brand) {
                              currentBrandFilter = brand == 'ALL' ? '' : brand;
                              _filterCars();
                            },
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(child: verticalSpace(20)),
                      _buildResultsSection(),
                      SliverToBoxAdapter(child: verticalSpace(14)),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultsSection() {
    if (isInitialLoad) {
      return _buildLoadingIndicator();
    }

    if (isLoading) {
      return _buildLoadingIndicator(height: 200);
    }

    if (searchedCars.isEmpty) {
      return _buildEmptyResultsMessage();
    }

    return CustomSearchGridView(context: context, searchedCars: searchedCars);
  }

  Widget _buildLoadingIndicator({double? height}) {
    return const SliverFillRemaining(child: CustomGridViewLoading());
  }

  Widget _buildEmptyResultsMessage() {
    return SliverFillRemaining(
      child: Column(children: [verticalSpace(100), const NoCarsAvailable()]),
    );
  }
}
