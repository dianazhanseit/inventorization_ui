#include "loginserver.h"
#include <QSqlQuery>
#include <QSqlError>

LoginServer::LoginServer(QQuickItem* parent):
    QQuickItem(parent)
{}

void LoginServer::submitLoginForm(const QString &personID, const QString &password)
{
    auto passwordCopy = password;
    passwordCopy.append('"');
    passwordCopy.prepend('"');
    QString findUser = QString("SELECT COUNT(*) "
                               "FROM USER "
                               "WHERE id=%1 AND password=%2").arg(personID, passwordCopy);

    QSqlQuery findUserQuery(findUser);
    if (findUserQuery.lastError().type() != QSqlError::NoError)
    {
        throw std::runtime_error{findUserQuery.lastError().text().toStdString()};
    }

    findUserQuery.next();
    auto match = findUserQuery.value(0).toInt();
    if (!match)
    {
        loggedIn = false;
        return;
    }

    loggedIn = true;
    this->personID = personID;
    personPassword = password;
}

bool LoginServer::isLoggedIn()
{
    return loggedIn;
}

QString LoginServer::getPersonID()
{
    return personID;
}

QString LoginServer::getPersonPassword()
{
    return personPassword;
}
