import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mind/features/user/presentation/controllers/change_name_controller.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/validators/validators.dart';

class ChangeNamePage extends StatelessWidget {
  const ChangeNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomChangeNameController changeNameController =
        Get.put(CustomChangeNameController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Change Name",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      // Body
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(
              'Your name will not be added in the global ranking database, Choose a fun name.',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: CColors.lightGrey),
            ),

            const SizedBox(
              height: CSizes.spaceBtwSections,
            ),

            Form(
              key: changeNameController.changeNameKey,
              child: Column(
                children: [
                  // First name
                  TextFormField(
                    controller: changeNameController.changeNameController,
                    validator: (String? value) {
                      return UValidator.validateEmptyText('name', value);
                    },
                    expands: false,
                    decoration: InputDecoration(
                        labelStyle: Theme.of(context).textTheme.labelSmall,
                        labelText: 'Name',
                        prefixIcon: const Icon(Iconsax.user)),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: CSizes.spaceBtwSections,
            ),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  changeNameController.saveName();
                },
                child: const Text("Save"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
