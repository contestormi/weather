/// Класс для упрощения отображения иконок с [OpenWeatherAPI]
class IconStringBuilder {
  static String network(String icon) {
    return "http://openweathermap.org/img/wn/$icon@4x.png";
  }
}
