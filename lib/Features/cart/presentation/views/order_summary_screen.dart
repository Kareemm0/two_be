import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_be/Features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:two_be/Features/Auth/presentation/cubit/auth_state.dart';
import 'package:two_be/Features/cart/presentation/cubit/cart_cubit.dart';
import 'package:two_be/Features/cart/presentation/widget/custom_choocse_payment_container.dart';
import 'package:two_be/Features/categories/presentation/widget/custom_header_and_icon.dart';
import 'package:two_be/core/extension/extension.dart';
import 'package:two_be/core/functions/show_toast.dart';
import 'package:two_be/core/routes/routes.dart';
import 'package:two_be/core/utils/app_colors.dart';
import 'package:two_be/core/utils/app_sizes.dart';
import 'package:two_be/di.dart';
import '../../../../core/cache/save_user_info.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/custom_app_text.dart';
import '../../../../core/widgets/custom_countries_pupop_dialog.dart';
import '../../../Auth/Data/Model/user.dart';
import '../../../Auth/presentation/widget/custom_contry_item_grid_view.dart';
import '../../../Auth/presentation/widget/custom_text_form_filed.dart';

class OrderSummaryScreen extends StatefulWidget {
  final String totalPrice;
  const OrderSummaryScreen({super.key, required this.totalPrice});

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  User? _user;

  Future<void> load() async {
    User? user = await getUserFromSharedPreferences();
    setState(() {
      _user = user;
    });
    log("$user");
    log("${user!.username}");
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(getIt())..getCart(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CreateOrderFailureState) {
            showToast(message: state.message, backgroundColor: AppColors.redED);
          } else if (state is CreateOrderSuccessState) {
            showToast(
                message: "تم انشاء الطلب", backgroundColor: AppColors.green);
            context.read<CartCubit>().currentIndex == 2
                ? context.pushReplacement(Routes.bottomNavigationBar)
                : null;
          }
        },
        builder: (context, state) {
          final cubit = context.read<CartCubit>();
          final authCubit = context.read<AuthCubit>();
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 40,
                      ),
                      child: Column(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomHeaderAndIcon(title: "تاكيد الطلب"),
                          height(32),
                          BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, state) {
                              return CustomTextFormFiled(
                                hintColor: AppColors.primaryColor,
                                controller: TextEditingController(),
                                borderColor: AppColors.primaryColor,
                                hintText: authCubit.selectedItem == ""
                                    ? "اختار الدوله"
                                    : authCubit.selectedItem,
                                enabled: false,
                              );
                            },
                          ).onTap(
                            () {
                              popupDropDownDialogs(context: context, children: [
                                SizedBox(
                                  height: heightSize(context) * 0.7,
                                  width: double.maxFinite,
                                  child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                    ),
                                    itemBuilder: (context, index) {
                                      return CustomContryItemGridView(
                                        flag: authCubit.countries[index].flag ??
                                            "",
                                        name: authCubit.countries[index].name ??
                                            "",
                                      ).onTap(() {
                                        setState(() {
                                          authCubit.selectedItem =
                                              authCubit.countries[index].name!;
                                        });
                                        context.pop();
                                      });
                                    },
                                    itemCount: authCubit.countries.length,
                                  ),
                                )
                              ]);
                            },
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: CustomTextFormFiled(
                                  textInputColor: AppColors.primaryColor,
                                  hintText: "ادخل المحافظه",
                                  hintColor: AppColors.primaryColor,
                                  controller: cubit.cityController,
                                  borderColor: AppColors.primaryColor,
                                ),
                              ),
                              width(16),
                              Flexible(
                                child: CustomTextFormFiled(
                                  textInputColor: AppColors.primaryColor,
                                  hintText: "ادخل الحي",
                                  hintColor: AppColors.primaryColor,
                                  controller: cubit.stateController,
                                  borderColor: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "اختار طريقة الدفع",
                            style: AppTextStyle.style16,
                          ),
                          ...List.generate(
                            cubit.payImages.length,
                            (index) => GestureDetector(
                              onTap: () => cubit.changeIndex(index),
                              child: CustomChoocsePaymentContainer(
                                image: cubit.payImages[index],
                                isChoose: cubit.currentIndex == index,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Button at the bottom
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomAppButton(
                    text: "تأكيد الطلب",
                    onPressed: () {
                      cubit.createOrder(
                        context,
                        customerEmail: _user?.email ?? "",
                        customerName: _user?.username ?? "",
                        address: _user?.country ?? "",
                        phone: _user?.phone ?? "",
                        amount: double.parse(widget.totalPrice).toString(),
                        tabbyAmount: widget.totalPrice,
                        country: authCubit.selectedItem,
                      );
                      log("============================${widget.totalPrice}");
                    },
                    radius: 30,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
