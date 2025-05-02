import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mptc_exercise_banhahuy/feature/home/data/models/category.dart';

import 'package:mptc_exercise_banhahuy/feature/home/presentation/page/home_page.dart';

class MockHomeBloc extends Mock implements HomeBloc {}

void main() {
  late MockHomeBloc mockBloc;

  setUp(() {
    mockBloc = MockHomeBloc();
  });

  Widget buildTestWidget() {
    return MaterialApp(
      home: BlocProvider<HomeBloc>.value(
        value: mockBloc,
        child: const HomePage(),
      ),
    );
  }

  testWidgets('displays loading indicator when state is HomeLoading', (tester) async {
    when(() => mockBloc.state).thenReturn(HomeLoading());
    whenListen(mockBloc, Stream.value(HomeLoading()));

    await tester.pumpWidget(buildTestWidget());
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('displays categories when state is HomeLoaded', (tester) async {
    final testCategories = [
      Category(id: 1, name: 'Test', title: 'Title 1', body: 'Body 1'),
      Category(id: 2, name: 'Test2', title: 'Title 2', body: 'Body 2'),
    ];

    when(() => mockBloc.state).thenReturn(HomeLoaded(categories: testCategories));
    whenListen(mockBloc, Stream.value(HomeLoaded(categories: testCategories)));

    await tester.pumpWidget(buildTestWidget());
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
    expect(find.text('Title 1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('Title 2'), findsOneWidget);
  });

  testWidgets('displays error message when state is HomeError', (tester) async {
    when(() => mockBloc.state).thenReturn(HomeError(message: 'Something went wrong'));
    whenListen(mockBloc, Stream.value(HomeError(message: 'Something went wrong')));

    await tester.pumpWidget(buildTestWidget());
    await tester.pump();

    expect(find.text('Something went wrong'), findsOneWidget);
  });
}
