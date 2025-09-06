import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/features/address/presentation/bloc/bloc/address_bloc.dart';

Widget shippingAddressSection() {
  return BlocBuilder<AddressBloc, AddressState>(
    builder: (context, state) {
      if (state is AddressLoading) {
        return loader();
      } else if (state is AddressFailure) {
        return const Center(child: Text("Something went wrong"));
      } else if (state is AddressLoaded) {
        return state.shippingAddressList.isEmpty
            ? const SizedBox()
            : Column(
                children: [
                  Text(
                    "Shipping Address",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(5.h),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.shippingAddressList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final addressData = state.shippingAddressList[index];
                      final String address = addressData.address ?? "";
                      final String city = addressData.cityName ?? "";
                      final String postalCode = addressData.postalCode ?? "";
                      final String number = addressData.phone ?? "";
                      final shippingAddress =
                          "$address, $city, $postalCode, $number,";
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 7.h),
                          decoration: BoxDecoration(
                            boxShadow: boxShadow,
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 4.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Transform.scale(
                                  scale: 0.8,
                                  child: Radio<String>(
                                    value: addressData.id.toString(),
                                    groupValue: "",
                                    activeColor: AppColors.primaryColor,
                                    onChanged: (String? value) async {},
                                  ),
                                ),
                                Expanded(
                                    child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        shippingAddress,
                                        style: TextStyle(fontSize: 11.sp),
                                      ),
                                    ),
                                    Gap(5.w),
                                    PopupMenuButton<String>(
                                      icon: Icon(
                                        Icons.more_vert,
                                        color: AppColors.darkGrey,
                                        size: 15,
                                      ),
                                      onSelected: (value) async {
                                        if (value == 'edit') {
                                        } else if (value == 'delete') {}
                                      },
                                      itemBuilder: (BuildContext context) => [
                                        const PopupMenuItem<String>(
                                          value: 'edit',
                                          child: Text(edit),
                                        ),
                                        const PopupMenuItem<String>(
                                          value: 'delete',
                                          child: Text(delete),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
      }
      return const SizedBox();
    },
  );
}
