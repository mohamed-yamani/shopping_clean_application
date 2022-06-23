import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/common/constants/size_constants.dart';
import 'package:petshop/common/constants/translation_constants.dart';
import 'package:petshop/common/extensions/size_extensions.dart';
import 'package:petshop/common/extensions/string_extentions.dart';
import 'package:petshop/di/get_it.dart';
import 'package:petshop/domain/entites/product_details_entity.dart';
import 'package:petshop/presentation/blocs/product_details/product_details_bloc.dart';
import 'package:petshop/presentation/journeys/product_details/big_poster.dart';
import 'package:petshop/presentation/journeys/product_details/product_detail_arguments.dart';
import 'package:petshop/presentation/journeys/product_details/sumilar_products_widget.dart';
import 'package:petshop/presentation/widgets/button.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductDetailArguments arguments;

  const ProductDetailScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late ProductDetailsBloc _productDetailsBloc;

  @override
  void initState() {
    super.initState();
    _productDetailsBloc = getItInstance<ProductDetailsBloc>();
    _productDetailsBloc
        .add(ProductDataLoadEvent(productId: widget.arguments.productId));
  }

  @override
  void dispose() {
    _productDetailsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ProductDetailsBloc>.value(
        value: _productDetailsBloc,
        child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsLoaded) {
              final ProductDetailsEntity productDetails = state.productDetail;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BigPoster(productDetails: productDetails),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
                      child: Text(
                        productDetails.description!,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.dimen_16),
                      child: Button(text: 'addToCart', onPressed: () {}),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: Sizes.dimen_10.h,
                          left: Sizes.dimen_16.w,
                          right: Sizes.dimen_16.w),
                      child: Text(
                        TranslationConstants.sumilarProducts.t(context),
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    SumilarProductsWidget(
                        produitsSimilaire: productDetails.produitsSimilaire),
                  ],
                ),
              );
            } else if (state is ProductDetailsError) {
              return const Center(
                child: Text('Error'),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
