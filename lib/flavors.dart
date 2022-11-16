enum Flavor {
  DEV,
  PROD,
}

class F {
  static Flavor? appFlavor;

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'Aufguss app（dev）';
      case Flavor.PROD:
        return 'Aufguss app';
      default:
        return 'title';
    }
  }

}
