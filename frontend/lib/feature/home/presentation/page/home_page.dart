import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mptc_exercise_banhahuy/core/constants/app_resource.dart';
import 'package:mptc_exercise_banhahuy/core/l10n/l10n.dart';
import 'package:mptc_exercise_banhahuy/feature/home/data/models/category.dart';
import 'package:mptc_exercise_banhahuy/feature/home/presentation/bloc/category/category_bloc.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:mptc_exercise_banhahuy/feature/home/presentation/widget/profile_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  Category _selectedFilter = Category(id: 0, name: 'All');

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    
    // Fetch profiles and categories when the page loads
    // context.read<CategoryBloc>().add(const FetchCategories());
    // context.read<ProfileBloc>().add(const FetchProfiles());
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.trim();
    print("""object $query""");
    context.read<ProfileBloc>().add(FilterProfiles(query: query));
  }

  void _updateFilter(Category filter) {
    setState(() {
      _selectedFilter = filter;
    });
    
    // Trigger profile filtering with the new category
    context.read<ProfileBloc>().add(
          FilterProfiles(
            filter: filter.name ?? '',
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: false,
              snap: false,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  AppResource.appLogoUrl,
                  width: 32,
                  height: 32,
                ),
              ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    color: Color(0xFF6C63FF),
                  ),
                  onPressed: () {
                    context.push('/camera_screen');
                  },
                ),
                IconButton(
                  icon: const CircleAvatar(
                    radius: 16,
                    backgroundColor: Color(0xFFE9ECEF),
                    child: Icon(
                      Icons.person_outline,
                      size: 18,
                      color: Color(0xFF6C63FF),
                    ),
                  ),
                  onPressed: () {
                    context.go('/home/settings');
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // AppLocalizations.of(context).findProfessionalProfiles,
                      "Find Professional Profiles",
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF2D3748),
                          ),
                    ),
                    const SizedBox(height: 24),
                    _buildSearchField(),
                    const SizedBox(height: 24),
                    _buildCategoryFilter(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            _buildProfileList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/home/profile/upsert');
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: "Search profiles",
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontSize: 14,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).primaryColor,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CategoryLoaded) {
          return SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                final filter = state.categories[index];
                final isSelected = _selectedFilter.id == filter.id;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(filter.name ?? ''),
                    selected: isSelected,
                    onSelected: (_) => _updateFilter(filter),
                    backgroundColor: Colors.white,
                    selectedColor: Theme.of(context).primaryColor.withOpacity(0.1),
                    checkmarkColor: Theme.of(context).primaryColor,
                    labelStyle: TextStyle(
                      color: isSelected ? Theme.of(context).primaryColor : Colors.grey[700],
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected ? Theme.of(context).primaryColor : Colors.grey[300]!,
                        width: 1,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                );
              },
            ),
          );
        } else if (state is CategoryError) {
          return Center(child: Text(state.message));
        }
        return Center(child: Text(AppLocalizations.of(context).home));
      },
    );
  }

  Widget _buildProfileList() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is ProfileLoaded) {
          if (state.profiles.isEmpty) {
            return SliverFillRemaining(
              child: Center(
                child: Text(
                  "No profiles found",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            );
          }
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ProfileCard(
                    profile: state.profiles[index],
                    onTap: () {
                      context.push(
                        '/home/profile',
                        extra: state.profiles[index],
                      );
                    },
                  );
                },
                childCount: state.profiles.length,
              ),
            ),
          );
        } else if (state is ProfileError) {
          return SliverFillRemaining(
            child: Center(child: Text(state.message)),
          );
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}