import 'package:material_ui/material_ui.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.person_outline, size: 64),
          const SizedBox(height: 16),
          Text('Profile', style: Theme.of(context).textTheme.headlineSmall),
        ],
      ),
    );
  }
}
