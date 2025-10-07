import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tarcking_app/core/errors/api_result.dart';
import 'package:tarcking_app/features/localization/localization_controller/localization_cubit.dart';
import 'package:tarcking_app/features/logout/viewmodel/logout_viewmodel.dart';
import 'package:tarcking_app/features/profile/domain/entity/user_entity.dart';
import 'package:tarcking_app/features/profile/presentation/view/profile_screen.dart';
import 'package:tarcking_app/features/profile/presentation/viewmodel/profile_viewmodel.dart';
import 'package:tarcking_app/features/profile/presentation/viewmodel/states/profile_states.dart';
import '../../../../widget_test_helpers.mocks.dart';
import '../../profile_mocks.dart';
import 'profile_screen_test.mocks.dart' hide MockGetProfileDataUseCase;

@GenerateMocks([NavigatorObserver])
void main() {
  late ProfileViewModel viewModel;
  late MockGetProfileDataUseCase mockGetProfileDataUseCase;
  late MockLogoutViewModel mockLogoutViewModel;
  late MockLocalizationCubit mockLocalizationCubit;
  late MockNavigatorObserver mockNavigatorObserver;
  late UserEntity testUser;

  setUp(() {
    mockGetProfileDataUseCase = MockGetProfileDataUseCase();
    mockLogoutViewModel = MockLogoutViewModel();
    mockLocalizationCubit = MockLocalizationCubit();
    mockNavigatorObserver = MockNavigatorObserver();

    testUser = UserEntity(
      id: '123',
      firstName: 'John',
      lastName: 'Doe',
      email: 'john.doe@example.com',
      gender: 'male',
      phone: '1234567890',
      photo: 'https://example.com/photo.jpg',
      role: 'driver',
    );

    viewModel = ProfileViewModel(mockGetProfileDataUseCase);
  });

  tearDown(() {
    reset(mockGetProfileDataUseCase);
    reset(mockLogoutViewModel);
    reset(mockLocalizationCubit);
    reset(mockNavigatorObserver);
  });

  Widget createTestableWidget() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileViewModel>.value(value: viewModel),
        BlocProvider<LogoutViewModel>.value(value: mockLogoutViewModel),
        BlocProvider<LocalizationCubit>.value(value: mockLocalizationCubit),
      ],
      child: MaterialApp(
        home: const ProfileScreen(),
        navigatorObservers: [mockNavigatorObserver],
      ),
    );
  }

  group('ProfileScreen', () {
    testWidgets('should show loading indicator when loading profile data', (
        WidgetTester tester,
        ) async {
      // Arrange
      when(mockGetProfileDataUseCase()).thenAnswer(
            (_) async => Future.delayed(
          const Duration(milliseconds: 100),
              () => ApiSuccessResult(testUser),
        ),
      );

      // Act
      await tester.pumpWidget(createTestableWidget());
      await tester.pump(); // Trigger loading state

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should show profile data when loaded successfully', (
        WidgetTester tester,
        ) async {
      // Arrange
      when(
        mockGetProfileDataUseCase(),
      ).thenAnswer((_) async => ApiSuccessResult(testUser));

      // Act
      await tester.pumpWidget(createTestableWidget());
      await tester.pumpAndSettle(); // Wait for async operations

      // Assert
      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('john.doe@example.com'), findsOneWidget);
      expect(find.text('1234567890'), findsOneWidget);
    });

    testWidgets('should show error message when profile loading fails', (
        WidgetTester tester,
        ) async {
      // Arrange
      when(
        mockGetProfileDataUseCase(),
      ).thenAnswer((_) async => ApiErrorResult('Failed to load profile'));

      // Act
      await tester.pumpWidget(createTestableWidget());
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Failed to load profile'), findsOneWidget);
      expect(viewModel.state, isA<ProfileErrorState>());
      expect(
        (viewModel.state as ProfileErrorState).message,
        'Failed to load profile',
      );
    });

    testWidgets('should call getProfile on initialization', (
        WidgetTester tester,
        ) async {
      // Arrange
      when(
        mockGetProfileDataUseCase(),
      ).thenAnswer((_) async => ApiSuccessResult(testUser));

      // Act
      await tester.pumpWidget(createTestableWidget());
      await tester.pumpAndSettle();

      // Assert
      verify(mockGetProfileDataUseCase()).called(1);
    });

    testWidgets(
      'should navigate to edit profile screen when edit button is tapped',
          (WidgetTester tester) async {
        // Arrange
        when(
          mockGetProfileDataUseCase(),
        ).thenAnswer((_) async => ApiSuccessResult(testUser));

        // Act
        await tester.pumpWidget(createTestableWidget());
        await tester.pumpAndSettle();

        final editButton = find.byKey(const Key('edit_profile_button'));
        await tester.tap(editButton);
        await tester.pumpAndSettle();

        // Assert
        verify(mockNavigatorObserver.didPush(any, any)).called(1);
      },
    );
  });
}