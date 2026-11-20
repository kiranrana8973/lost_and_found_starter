import 'dart:typed_data';

import 'package:material_ui/material_ui.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final _formKey = GlobalKey<FormState>();
  final _itemNameController = TextEditingController();
  final _locationController = TextEditingController();
  final _commentController = TextEditingController();

  static const _categories = [
    'Electronics',
    'Wallet & Cards',
    'Keys',
    'Documents',
    'Bags',
    'Clothing',
    'Jewelry',
    'Other',
  ];

  String? _selectedCategory;
  Uint8List? _imageBytes;

  @override
  void dispose() {
    _itemNameController.dispose();
    _locationController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  void _pickImage() {
    // TODO: pick an image and set _imageBytes
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    // TODO: send _imageBytes, item name, category, location and comment to the report use case
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: _pickImage,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 200,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: colorScheme.outline),
                ),
                child: _imageBytes != null
                    ? Image.memory(_imageBytes!, fit: BoxFit.cover)
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 48,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Tap to add a photo',
                            style: TextStyle(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            if (_imageBytes != null)
              TextButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.edit),
                label: const Text('Change photo'),
              ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _itemNameController,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Item Name',
                prefixIcon: Icon(Icons.inventory_2_outlined),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter the item name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              initialValue: _selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Category',
                prefixIcon: Icon(Icons.category_outlined),
                border: OutlineInputBorder(),
              ),
              items: _categories
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (value) => setState(() => _selectedCategory = value),
              validator: (value) =>
                  value == null ? 'Please select a category' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _locationController,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Location',
                prefixIcon: Icon(Icons.location_on_outlined),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter the location';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _commentController,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.multiline,
              minLines: 4,
              maxLines: 6,
              decoration: const InputDecoration(
                labelText: 'Comment',
                hintText: 'Add any details that help identify the item',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _submit,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Submit Report'),
            ),
          ],
        ),
      ),
    );
  }
}
