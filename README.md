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

## Развертывание в докере

**Source:**
```bash
FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update \
&& apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget
RUN useradd -ms /bin/bash user
USER user
WORKDIR /home/user

#Installing Android SDK
RUN mkdir -p Android/sdk
ENV ANDROID_SDK_ROOT /home/user/Android/sdk
RUN mkdir -p .android && touch .android/repositories.cfg
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
RUN unzip sdk-tools.zip && rm sdk-tools.zip
RUN mv tools Android/sdk/tools
RUN cd Android/sdk/tools/bin && yes | ./sdkmanager --licenses
RUN cd Android/sdk/tools/bin && ./sdkmanager "build-tools;29.0.2" "patcher;v4" "platform-tools" "platforms;android-29" "sources;android-29"
ENV PATH "$PATH:/home/user/Android/sdk/platform-tools"

#Installing Flutter SDK
RUN git clone https://github.com/flutter/flutter.git
ENV PATH "$PATH:/home/user/flutter/bin"
RUN flutter channel stable
RUN flutter doctor

#Run Flutter Tests
RUN git clone https://github.com/contestormi/weather.git
RUN cd \weather && flutter test
```

**Команда для сборки образа:**
```bash
docker build -t flutter_dockerfile .
```

**Команда для запуска образа:**
```bash
docker run --rm -it flutter_dockerfile
```

## User Story

|                  |        |                                      |
| ---------------- | ------ | ------------------------------------ |
| Заказчик (actor) | Как    | Пользователь                         |
| Примечание       | Я хочу | Увидеть погоду в заданном городе     |
| Цель             | Чтобы  | Получить немедленный доступ к погоде |
