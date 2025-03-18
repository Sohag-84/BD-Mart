import 'package:gym_swat/core/constants/exports.dart';

Widget addNewAddressButton(
  BuildContext context,
) {
  return InkWell(
    onTap: () {
      //buildShowAddFormDialog(context, controller);
    },
    child: Container(
      height: 80.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Add New Address",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Icon(
            Icons.add,
            color: AppColors.primaryColor,
          )
        ],
      ),
    ),
  );
}
Widget addNewAddressButton1(
  BuildContext context,
) {
  return InkWell(
    onTap: () {
      //buildShowAddFormDialog(context, controller);
    },
    child: Container(
      height: 80.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Add New Address",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Icon(
            Icons.add,
            color: AppColors.primaryColor,
          )
        ],
      ),
    ),
  );
}
