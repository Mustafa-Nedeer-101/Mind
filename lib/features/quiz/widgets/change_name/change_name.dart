import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mind/utils/constants/sizes.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              'Use real name for easy verification. this name will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ),

            const SizedBox(
              height: CSizes.spaceBtwSections,
            ),

            Form(
              child: Column(
                children: [
                  // First name
                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: 'Username', prefixIcon: Icon(Iconsax.user)),
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
                onPressed: () {},
                child: const Text("Save"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
