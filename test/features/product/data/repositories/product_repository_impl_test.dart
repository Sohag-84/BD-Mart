// import 'package:flutter_test/flutter_test.dart';
// import 'package:gym_swat/core/error/failure.dart';
// import 'package:gym_swat/features/product/data/datasources/product_remote_data_source_impl.dart';
// import 'package:gym_swat/features/product/data/models/product_model.dart';
// import 'package:gym_swat/features/product/data/repository/product_repository_impl.dart';
// import 'package:gym_swat/features/product/domain/entity/product_details_entity.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:gym_swat/core/services/api_services.dart';
// import 'package:gym_swat/core/config/app_config.dart';

// class MockApiServices extends Mock implements ApiServices {}

// void main() {
//   late MockApiServices mockApiServices;
//   late ProductRemoteDataSourceImpl remoteDataSource;
//   late ProductRepositoryImpl repository;

//   setUp(() {
//     mockApiServices = MockApiServices();
//     remoteDataSource =
//         ProductRemoteDataSourceImpl(apiServices: mockApiServices);
//     repository = ProductRepositoryImpl(
//       productRemoteDataSource: remoteDataSource,
//     );
//   });
//   const tProductId = "123";

//   final tProductJson = {
//     "id": 1,
//     "name": "Test Product",
//     "added_by": "admin",
//     "seller_id": 1,
//     "shop_id": 1,
//     "shop_name": "Test Shop",
//     "shop_logo": "logo.png",
//     "photos": [],
//     "thumbnail_image": "thumb.png",
//     "tags": [],
//     "price_high_low": "100-200",
//     "choice_options": [],
//     "colors": [],
//     "has_discount": false,
//     "discount": "0",
//     "stroked_price": "200",
//     "main_price": "100",
//     "calculable_price": 100,
//     "currency_symbol": "\$",
//     "current_stock": 10,
//     "unit": "pcs",
//     "rating": 5,
//     "rating_count": 1,
//     "earn_point": 0,
//     "description_1st_part": "Short desc",
//     "description_2nd_part": "Long desc",
//     "description": "Full desc",
//     "video_link": null,
//     "brand": null,
//     "coupon_code": null,
//     "link": null,
//   };

//   group("Get Products", () {
//     test("should return Products list when API call is successful", () async {
//       //arrange
//       when(() => mockApiServices
//               .getApi(fullApiUrl: "${AppConfig.products}?page=1"))
//           .thenAnswer((_) async => {
//                 "data": [
//                   {
//                     "id": 1,
//                     "name": "Test Product",
//                     "thumbnail_image": "thumb.png",
//                     "has_discount": false,
//                     "discount": "0",
//                     "stroked_price": "200",
//                     "main_price": "100",
//                     "rating": 5,
//                     "sales": 0,
//                     "links": {"details": "details-url"}
//                   }
//                 ]
//               });

//       //act
//       final result = await repository.getProducts(
//         url: AppConfig.products,
//         page: 1,
//       );

//       //assert
//       expect(result.isRight(), true);
//       result.fold(
//         (_) => fail("Expected Right but got Left"),
//         (data) => {
//           expect(data, isA<List<Product>>()),
//           expect(data.first.name, "Test Product"),
//         },
//       );
//     });
//   });

//   group("getProductDetails", () {
//     test("should return ProductDetailsEntity list when API call is successful",
//         () async {
//       // arrange
//       when(() => mockApiServices.getApi(
//             endPoint: "${AppConfig.productDetails}$tProductId",
//           )).thenAnswer((_) async => {
//             "data": [tProductJson]
//           });

//       // act
//       final result = await repository.getProductDetails(productId: tProductId);

//       // assert
//       expect(result.isRight(), true);
//       result.fold(
//         (_) => fail("Expected Right but got Left"),
//         (data) {
//           expect(data, isA<List<ProductDetailsEntity>>());
//           expect(data.first.name, "Test Product");
//         },
//       );

//       verify(() => mockApiServices.getApi(
//           endPoint: "${AppConfig.productDetails}$tProductId")).called(1);
//       verifyNoMoreInteractions(mockApiServices);
//     });

//     test("should return Failure when API throws exception", () async {
//       // arrange
//       when(() => mockApiServices.getApi(
//             endPoint: "${AppConfig.productDetails}$tProductId",
//           )).thenThrow(Exception("Server Error"));

//       // act
//       final result = await repository.getProductDetails(productId: tProductId);

//       // assert
//       expect(result.isLeft(), true);
//       result.fold(
//         (failure) => expect(failure, isA<ServerFailure>()),
//         (_) => fail("Expected Left but got Right"),
//       );
//     });
//   });
// }
