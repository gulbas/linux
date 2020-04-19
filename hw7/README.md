1. Написать Dockerfile для сборки образа, который будет запускать контейнер с django приложением, доуступным по ссылке: [https://github.com/mtuktarov/linux_stuff/tree/master/django-test-app](https://github.com/mtuktarov/linux_stuff/tree/master/django-test-app "https://github.com/mtuktarov/linux_stuff/tree/master/django-test-app"). Для запуска приложения использовать команду `python manage.py runserver 0.0.0.0:8000`, где `manage.py` - это файл из репозитория.
2. Зная, что в этом приложении django хранит базу в файле `db.sqlite3,` нужно избавиться от ошибки, которая появится при старте:
> You have 15 unapplied migration(s). Your project may not work properly until you apply the migrations for app(s): admin, auth, contenttypes, polls, sessions.
Run 'python manage.py migrate' to apply them.

3. Запустить контейнер так, чтобы приложение было доступным из браузера Ubuntu, используя Ubuntu hostname.
4. Создать аккаунт на Dockerhub и залить туда образ. Указать имя образа.