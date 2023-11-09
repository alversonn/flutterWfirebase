import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kicks/common/widgets/images/t_circular_image.dart';
import 'package:kicks/constants/colors.dart';
import 'package:kicks/constants/imge_strings.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(image: TImages.user, width: 50, height: 50, padding: 0,),
      title: Text('Alif Abdul Hakim', style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white)),
      subtitle: Text('alif.abdul@mhs.itenas.ac.id', style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white)),
      trailing: IconButton(onPressed: (){}, icon: const Icon(Iconsax.edit, color: TColors.white)),
    );
  }
}
