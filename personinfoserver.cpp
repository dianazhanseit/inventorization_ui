#include "personinfoserver.h"
#include <QSqlQuery>
#include <QSqlError>
#include <QVariantList>
#include <QVariantMap>
#include "commonqueries.h"

PersonInfoServer::PersonInfoServer(QQuickItem* parent):
    QQuickItem(parent)
{
    timer.setSingleShot(false);
    timer.setInterval(10000); //10 seconds
    timer.start();
    connect(&timer, SIGNAL(timeout()), this, SLOT(loadBorrowedItems()));
}


QString PersonInfoServer::getAvatarFile()
{
    return avatarFile;
}

void PersonInfoServer::setAvatarFile(const QString &newAvatarFile)
{
    avatarFile = newAvatarFile;
}

QString PersonInfoServer::getFirstName()
{
    return firstName;
}

QString PersonInfoServer::getLastName()
{
    return lastName;
}

QString PersonInfoServer::getSchool()
{
    return school;
}

QString PersonInfoServer::getPersonID()
{
    return personID;
}

void PersonInfoServer::setPersonID(const QString &newPersonID)
{
//    static bool isCalledOnce = false;
//    if (isCalledOnce)
//    {
//        throw std::runtime_error{"personID is set twice in one session"};
//    }
    personID = newPersonID;

    QSqlQuery infoRetrieveQuery(QString("SELECT photo, school, name, surname, lab_id "
                                        "FROM USER "
                                        "WHERE id=%1").arg(personID));
    if (!isSuccessfulQuery(infoRetrieveQuery))
    {
        throw std::runtime_error{infoRetrieveQuery.lastError().text().toStdString()};
    }

    infoRetrieveQuery.next();
    avatarFile = infoRetrieveQuery.value(0).toString();
    school = infoRetrieveQuery.value(1).toString();
    firstName = infoRetrieveQuery.value(2).toString();
    lastName = infoRetrieveQuery.value(3).toString();
    labID = infoRetrieveQuery.value(4).toString();
    loadBorrowedItems();

    avatarFileChanged();
    firstNameChanged();
    lastNameChanged();
    schoolChanged();
    labIDChanged();
}

QString PersonInfoServer::getPassword()
{
    return password;
}

void PersonInfoServer::setPassword(const QString &newPassword)
{
    if (password.isEmpty())
    {
        password = newPassword;
        return;
    }

    password = newPassword;
    //implement password update
    QSqlQuery updatePasswordQuery(QString("UPDATE USER SET password=%2 WHERE id=%1").arg(personID, password));
    if (!isSuccessfulQuery(updatePasswordQuery))
    {
        throw std::runtime_error{updatePasswordQuery.lastError().text().toStdString()};
    }
}

QVariantList PersonInfoServer::getBorrowedItems()
{
    return borrowedItems;
}

QString PersonInfoServer::getLabID()
{
    return labID;
}

void PersonInfoServer::setLabID(const QString &newLabID)
{
    labID = newLabID;
}

void PersonInfoServer::loadBorrowedItems()
{
    QString findBorrowedItems = QString("SELECT BORROWING.item_id, ITEM.name, LAB.name "
                                        "FROM BORROWING INNER JOIN ITEM ON BORROWING.item_id=ITEM.id"
                                        "     INNER JOIN LAB ON BORROWING.lab_id = LAB.id"
                                        " WHERE returned=false AND user_id=%1").arg(personID);

    QSqlQuery findBorrowedItemsQuery(findBorrowedItems);

    if (!isSuccessfulQuery(findBorrowedItemsQuery))
    {
        throw std::runtime_error{findBorrowedItemsQuery.lastError().text().toStdString()};
    }

    QVariantList newBorrowedItems;
    while (findBorrowedItemsQuery.next())
    {
        auto& query = findBorrowedItemsQuery;
        QVariantMap map;
        map["itemID"] = query.value(0);
        map["itemName"] = query.value(1);
        map["labName"] = query.value(2);
        newBorrowedItems.push_back(map);
    }

    if (borrowedItems != newBorrowedItems)
    {
        borrowedItems = std::move(newBorrowedItems);
        borrowedItemsChanged();
    }
}
