import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:gym_swat/core/error/failure.dart';
import 'package:gym_swat/features/product/domain/entity/product_details_entity.dart';
import 'package:gym_swat/features/product/domain/repositories/product_repository.dart';
import 'package:gym_swat/features/product/domain/usecases/get_product_details_usecase.dart';
import 'package:gym_swat/features/product/presentation/bloc/product_details/product_details_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late ProductDetailsBloc bloc;
  late MockProductRepository mockProductRepository;
  late GetProductDetailsUsecase productDetailsUsecase;

  setUp(() {
    mockProductRepository = MockProductRepository();
    productDetailsUsecase = GetProductDetailsUsecase(
      productRepository: mockProductRepository,
    );
    bloc = ProductDetailsBloc(productDetailsUsecase: productDetailsUsecase);
  });

  const productId = "12";
  final tProductDetails = [
    ProductDetailsEntity(
      id: 1,
      name: "Test Product",
      addedBy: "admin",
      sellerId: 1,
      shopId: 1,
      shopName: "Test Shop",
      shopLogo: "logo.png",
      photos: [],
      thumbnailImage: "thumb.png",
      tags: [],
      priceHighLow: "100-200",
      choiceOptions: [],
      colors: [],
      hasDiscount: false,
      discount: "0",
      strokedPrice: "200",
      mainPrice: "100",
      calculablePrice: 100,
      currencySymbol: "\$",
      currentStock: 10,
      unit: "pcs",
      rating: 5,
      ratingCount: 1,
      earnPoint: 0,
      description1StPart: "Short desc",
      description2NdPart: "Long desc",
      description: "Full desc",
      videoLink: null,
      brand: null,
      couponCode: null,
      link: null,
    ),
  ];

  test("initial state should ProductDetailsInitial", () {
    expect(bloc.state, ProductDetailsInitial());
  });

  blocTest<ProductDetailsBloc, ProductDetailsState>(
    "should emit [loading, loaded] when data is gotten successfully",
    build: () {
      when(() => mockProductRepository.getProductDetails(productId: productId))
          .thenAnswer((_) async => right(tProductDetails));
      return bloc;
    },
    act: (bloc) => bloc.add(const ProductDetailsFetch(productId: productId)),
    expect: () => [
      ProductDetailsLoading(),
      ProductDetailsLoaded(productDetails: tProductDetails),
    ],
  );

  blocTest<ProductDetailsBloc, ProductDetailsState>(
    "should emit [Loading, Failure] when repository fails",
    build: () {
      when(
        () => mockProductRepository.getProductDetails(productId: productId),
      ).thenAnswer(
        (_) async => left(
          const ServerFailure("Server error"),
        ),
      );
      return bloc;
    },
    act: (bloc) => bloc.add(
      const ProductDetailsFetch(productId: productId),
    ),
    expect: () => [
      ProductDetailsLoading(),
      const ProductDetailsFailure(error: "Server error")
    ],
  );
}
