#ifndef LOGINSERVER_H
#define LOGINSERVER_H

#include <QQuickItem>

class LoginServer : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(bool loggedIn READ isLoggedIn NOTIFY loggedInChanged)
    Q_PROPERTY(QString personID READ getPersonID NOTIFY personIDChanged)
    Q_PROPERTY(QString personPassword READ getPersonPassword NOTIFY personPasswordChanged)

    QString personID;
    QString personPassword;
    bool loggedIn;
public:
    LoginServer(QQuickItem* parent = nullptr);

signals:
    void personIDChanged(QString newPersonID);
    void personPasswordChanged(QString newPassword);
    void loggedInChanged(bool newState);
public slots:
    bool isLoggedIn();
    void submitLoginForm(const QString& personID, const QString& password);

    QString getPersonID();
    QString getPersonPassword();
};

#endif // LOGINSERVER_H
