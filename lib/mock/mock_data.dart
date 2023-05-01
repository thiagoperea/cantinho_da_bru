import 'package:cantinho_da_bru/data/item_entry.dart';

class MockData {
  const MockData();

  static List<ProductEntry> generateTruffles() {
    List<ProductEntry> truffles = [];

    truffles.add(new ProductEntry("Trufa de Chocolate ao Leite", "Deliciosa trufa de chocolate ao leite, perfeita para quem ama sabores clássicos", 4.50));
    truffles.add(new ProductEntry("Trufa de Chocolate Branco", "Lindamente decorada, essa trufa de chocolate branco derrete na boca!", 5.00));
    truffles.add(new ProductEntry("Trufa de Cereja", "Com um recheio de cereja fresca e cobertura de chocolate meio amargo, essa trufa é uma explosão de sabor", 6.00));
    truffles.add(new ProductEntry("Trufa de Limão Siciliano", "Refrescante e cítrica, essa trufa tem um recheio cremoso de limão siciliano e cobertura de chocolate branco", 5.50));
    truffles.add(new ProductEntry("Trufa de Framboesa", "Feita com framboesas frescas e cobertura de chocolate ao leite, essa trufa é o equilíbrio perfeito entre doce e azedo", 6.50));
    truffles.add(new ProductEntry("Trufa de Maracujá", "Agridoce e deliciosa, essa trufa tem um recheio refrescante de maracujá e cobertura de chocolate meio amargo", 6.00));
    truffles.add(new ProductEntry("Trufa de Café", "Para os amantes de café, essa trufa tem um recheio cremoso e intenso de café e cobertura de chocolate ao leite", 5.50));
    truffles.add(new ProductEntry("Trufa de Pistache", "Com um recheio delicado de pistache e cobertura de chocolate branco, essa trufa é perfeita para quem busca um sabor sofisticado", 7.00));
    truffles.add(new ProductEntry("Trufa de Baunilha", "Clássica e elegante, essa trufa tem um recheio cremoso de baunilha e cobertura de chocolate ao leite", 4.50));
    truffles.add(new ProductEntry("Trufa de Amêndoas", "Feita com amêndoas crocantes e cobertura de chocolate meio amargo, essa trufa é uma experiência deliciosa", 6.50));

    return truffles;
  }
}