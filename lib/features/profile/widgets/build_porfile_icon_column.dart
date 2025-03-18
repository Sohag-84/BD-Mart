import 'package:gym_swat/core/constants/exports.dart';

Row customProfileRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      //track order
      buildProfileIconColumn(
        icon: Icons.local_shipping_outlined,
        title: trackOrder,
        onTap: () {},
      ),

      ///message
      buildProfileIconColumn(
        icon: Icons.mail_outline,
        title: message,
        onTap: () {},
      ),

      ///review
      buildProfileIconColumn(
        icon: Icons.reviews_outlined,
        title: myReviews,
        onTap: () {},
      ),

      ///refund request
      buildProfileIconColumn(
        icon: Icons.currency_exchange_outlined,
        title: refund,
        onTap: () {},
      ),
    ],
  );
}

Row customProfileRow1() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      //digital products
      buildProfileIconColumn(
        icon: Icons.headset_mic_outlined,
        title: service,
        onTap: () {},
      ),

      ///message
      buildProfileIconColumn(
        icon: Icons.credit_card_outlined,
        title: paymentStatus,
        onTap: () {},
      ),

      ///review
      buildProfileIconColumn(
        icon: Icons.confirmation_num_outlined,
        title: coupons,
        onTap: () {},
      ),

      ///refund request
      buildProfileIconColumn(
        icon: Icons.description_outlined,
        title: blogs,
        onTap: () {},
      ),
    ],
  );
}

Widget buildProfileIconColumn({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        Icon(
          icon,
          color: AppColors.blackColor,
        ),
        Gap(5.h),
        Text(
          title,
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 9.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
