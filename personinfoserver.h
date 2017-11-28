#ifndef PERSONINFOSERVER_H
#define PERSONINFOSERVER_H

#include <QQuickItem>
#include <QVariantList>

class PersonInfoServer : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(QString avatarFile READ getAvatarFile WRITE setAvatarFile NOTIFY avatarFileChanged)
    Q_PROPERTY(QString firstName READ getFirstName NOTIFY firstNameChanged)
    Q_PROPERTY(QString lastName READ getLastName NOTIFY lastNameChanged)
    Q_PROPERTY(QString school READ getSchool NOTIFY schoolChanged)
    Q_PROPERTY(QString personID READ getPersonID WRITE setPersonID NOTIFY personIDChanged)
    Q_PROPERTY(QString password READ getPassword WRITE setPassword NOTIFY passwordChanged)
    Q_PROPERTY(QVariantList borrowedItems READ getBorrowedItems NOTIFY borrowedItemsChanged)
    QString avatarFile;
    QString firstName;
    QString lastName;
    QString school;
    QString personID;
    QString password;
    QVariantList borrowedItems;
public:
    PersonInfoServer(QQuickItem* parent = nullptr);

signals:
    void avatarFileChanged(QString newAvatarFile);
    void firstNameChanged();
    void lastNameChanged();
    void schoolChanged();
    void personIDChanged();
    void passwordChanged();
    void borrowedItemsChanged();

public slots:
    QString getAvatarFile();
    void setAvatarFile(const QString& newAvatarFile);

    QString getFirstName();
    QString getLastName();
    QString getSchool();

    QString getPersonID();
    void setPersonID(const QString& newPersonID);

    QString getPassword();
    void setPassword(const QString& newPassword);

    QVariantList getBorrowedItems();

private:
    void loadBorrowedItems();
};

#endif // PERSONINFOSERVER_H
