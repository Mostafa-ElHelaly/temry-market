import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temry_market/core/constant/colors%20copy.dart';
import 'package:temry_market/core/router/app_router.dart';
import 'package:temry_market/domain/usecases/product/get_product_usecase.dart';
import 'package:temry_market/presentation/blocs/filter/filter_cubit.dart';
import 'package:temry_market/presentation/widgets/input_form_button.dart';

class FilterProductsWidget extends StatelessWidget {
  const FilterProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,
      child: BlocBuilder<FilterCubit, FilterProductParams>(
        builder: (context, state) {
          return Badge(
            alignment: AlignmentDirectional.topEnd,
            label: Text(
              context.read<FilterCubit>().getFiltersCount().toString(),
              style: const TextStyle(color: Color.fromARGB(221, 255, 0, 0)),
            ),
            isLabelVisible: context.read<FilterCubit>().getFiltersCount() != 0,
            backgroundColor: Theme.of(context).primaryColor,
            child: InputFormButton(
              color: AppColors.secondary,
              onClick: () {
                Navigator.of(context).pushNamed(AppRouter.filter);
              },
            ),
          );
        },
      ),
    );
  }
}
