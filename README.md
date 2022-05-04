# Приложение для просмотра погоды

Мобильное приложение для отображения погоды в городе, который запрашивает пользователь. При первом входе в приложение можно дать разрешение на геолокацию, тогда погода отобразиться автоматически. При отсутствии интернета пользователь будет ограничен в действиях, и будет уведомлен об этом.

Документация классов приложения лежит в папке `doc/api`.

## Зависимости проекта
- [Connectivity Plus](https://pub.dev/packages/connectivity_plus)
- [Flutter Mobx](https://pub.dev/packages/flutter_mobx)
- [Geolocator](https://pub.dev/packages/geolocator)
- [Http](https://pub.dev/packages/http)
- [Intl](https://pub.dev/packages/intl)
- [Json Annotation](https://pub.dev/packages/json_annotation)
- [Json Serializable](https://pub.dev/packages/json_serializable)
- [Mobx](https://pub.dev/packages/mobx)
- [Shimmer](https://pub.dev/packages/shimmer)
- [Sliding Up Panel](https://pub.dev/packages/sliding_up_panel)

## Способ запуска проекта

**Шаг 1:**

В корне проекта подтягиваем необходимые зависимости:

```bash
flutter pub get 
```

**Шаг 2:**

Запускаем кодогенерацию, для того, чтобы сгенерить модели и стор:

```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

**Шаг 3:**

Запускаем приложение, находясь в корне проекта:

```bash
flutter run
```
## User Story

|                  |        |                                      |
| ---------------- | ------ | ------------------------------------ |
| Заказчик (actor) | Как    | Пользователь                         |
| Примечание       | Я хочу | Увидеть погоду в заданном городе     |
| Цель             | Чтобы  | Получить немедленный доступ к погоде |
