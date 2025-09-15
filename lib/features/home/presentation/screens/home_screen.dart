// home_screen.dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultankoo/features/categories/data/remote/categories_api_service.dart';
import 'package:sultankoo/features/categories/data/repo/categories_repo_impl.dart';
import 'package:sultankoo/features/categories/domain/repo/categories_repo.dart';

import '../../../../core/widgets/custom_refresh_indicator.dart';
import '../../../../core/widgets/top_app_bar.dart';
import '../controllers/home_cubit.dart';
import '../widgets/home_bloc_consumer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Dio>(
          create: (_) => Dio()..options = BaseOptions(
            baseUrl: 'https://tshl.me/categories', // Add your base URL
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
          ),
        ),
        RepositoryProvider<CategoriesApiService>(
          create: (context) => CategoriesApiService(
            context.read<Dio>(), // Pass the Dio instance
          ),
        ),
        RepositoryProvider<CategoriesRepo>(
          create: (context) => CategoriesRepoImpl(
            context.read<CategoriesApiService>(),
          ),
        ),
      ],
      child: Scaffold(
        appBar: const TopAppBar(title: 'الرئيسية'),
        body: SafeArea(
          child: CustomRefreshIndicator(
            onRefresh: () async {
              context.read<HomeCubit>().getCategories();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [HomeBlocConsumer()],
              ),
            ),
          ),
        ),
      ),
    );
  }
}