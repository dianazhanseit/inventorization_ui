#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QSqlDatabase>
#include <stdexcept>
#include <QSqlError>

#include "loginserver.h"
#include "personinfoserver.h"
#include "searchserver.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    qmlRegisterType<LoginServer>("com.login.credits", 1, 0, "LoginInfo");
    qmlRegisterType<PersonInfoServer>("com.info", 1, 0, "PersonInfoServer");
    qmlRegisterType<searchServer>("com.searching", 1, 0, "SearchServer");
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("localhost");
    db.setDatabaseName("TEST");
    db.setUserName("root");
    db.setPassword("123");
    if (!db.open())
    {
        throw std::runtime_error{db.lastError().text().toStdString()};
    }

    return app.exec();
}
