import 'package:material_ui/material_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.home_outlined, size: 64),
          const SizedBox(height: 16),
          Text('Home', style: Theme.of(context).textTheme.headlineSmall),
        ],
      ),
    );
  }
}
