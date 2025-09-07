import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/core/widgets/button.dart';
import 'package:gym_swat/core/widgets/custom_input_decoration.dart';

Future<void> buildAddAddressDialog({
  required BuildContext context,
  required TextEditingController addressController,
  required TextEditingController postalCodeController,
  required TextEditingController phoneController,
}) async {
  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: AppColors.whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              insetPadding: const EdgeInsets.symmetric(horizontal: 10),
              contentPadding: const EdgeInsets.only(
                top: 36.0,
                left: 36.0,
                right: 36.0,
                bottom: 2.0,
              ),
              content: SizedBox(
                width: 400.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Address field
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Address",
                        style: TextStyle(
                          color: AppColors.darkGrey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: SizedBox(
                        height: 55.h,
                        child: TextField(
                          controller: addressController,
                          style: TextStyle(
                            color: AppColors.darkGrey,
                            fontSize: 12.sp,
                          ),
                          decoration: InputDecorations.buildInputDecoration_1(
                            hintText: "Enter your address",
                          ),
                        ),
                      ),
                    ),
                    // Postal code
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Postal Code",
                        style: TextStyle(
                          color: AppColors.darkGrey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: TextField(
                        controller: postalCodeController,
                        decoration: InputDecorations.buildInputDecoration_1(
                            hintText: "Enter postal code"),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Phone number
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Phone Number",
                        style: TextStyle(
                          color: AppColors.darkGrey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: TextField(
                        controller: phoneController,
                        decoration: InputDecorations.buildInputDecoration_1(
                            hintText: "Enter phone number"),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              // Action buttons
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Close Button
                    Button.minWidthFixHeight(
                      minWidth: 75,
                      height: 40,
                      color: const Color.fromRGBO(253, 253, 253, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        side: const BorderSide(
                            color: AppColors.lightGrey, width: 1),
                      ),
                      child: const Text(
                        "Close",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () =>
                          Navigator.of(context, rootNavigator: true).pop(),
                    ),
                    const SizedBox(width: 8),

                    // Submit Button
                    Button.minWidthFixHeight(
                      minWidth: 75,
                      height: 40,
                      color: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: const Text(
                        "Add",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () async {},
                    ),
                  ],
                ),
              ],
            );
          },
        );
      });
}
