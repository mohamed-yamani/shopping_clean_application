import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/presentation/blocs/sub_categories/sub_categories_bloc.dart';

class ProductsList extends StatelessWidget {
  final SubCategoriesBloc? subCategoriesBloc;
  ProductsList({Key? key, required this.subCategoriesBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubCategoriesBloc, SubCategoriesState>(
      builder: (context, state) {
        if (state is SubCategoriesLoaded) {
          return Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: state.subCategories
                      .map((e) => Column(
                            children: [
                              Text(e.nom!),
                              Text(e.id.toString()),
                            ],
                          ))
                      .toList(),
                ),
              ),
              Center(
                child: Text('${state.subCategories.length}'),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
