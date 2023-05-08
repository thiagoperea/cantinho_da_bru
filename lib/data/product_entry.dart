class ProductEntry {
  final String name;
  final String description;
  final double value;
  final String imageUrl;
  final bool hasStock;

  ProductEntry(this.name, this.description, this.value, this.imageUrl, this.hasStock);

  factory ProductEntry.fromJson(Map<String, dynamic> json) {
    return ProductEntry(
      json['name'] as String,
      json['description'] as String,
      (json['value'] as num).toDouble(),
      json['image_url'] as String,
      json['has_stock'] as bool
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'value': value,
    'image_url': imageUrl,
    'has_stock': hasStock
  };
}
