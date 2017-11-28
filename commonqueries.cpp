#include "commonqueries.h"
#include <QVariant>

bool itemExists(const QString& itemID)
{
    QString countItemQuery = QString("SELECT COUNT(*) FROM ITEM WHERE id=%1").arg(itemID);
    QSqlQuery existsQuery(countItemQuery);
    if (existsQuery.lastError().type() != QSqlError::NoError)
    {
        throw std::runtime_error{existsQuery.lastError().text().toStdString()};
    }
    existsQuery.next();
    return existsQuery.value(0).toInt() != 0;
}

bool userExists(const QString &personID)
{
    QString countPersonQuery = QString("SELECT COUNT(*) FROM USER WHERE id=%1").arg(personID);
    QSqlQuery existsQuery(countPersonQuery);
    if (existsQuery.lastError().type() != QSqlError::NoError)
    {
        throw std::runtime_error{existsQuery.lastError().text().toStdString()};
    }
    existsQuery.next();
    return existsQuery.value(0).toInt() != 0;
}

bool isBorrowed(const QString &itemID)
{
    QString countBorrowingQuery = QString("SELECT COUNT(*) FROM BORROWING WHERE item_id=%1 AND returned=false").arg(itemID);
    QSqlQuery existsQuery(countBorrowingQuery);
    if (existsQuery.lastError().type() != QSqlError::NoError)
    {
        throw std::runtime_error{existsQuery.lastError().text().toStdString()};
    }
    existsQuery.next();
    return existsQuery.value(0).toInt() != 0;
}

QString findAssociatedLab(const QString &personID)
{
    QString findLabQuery = QString("SELECT lab_id FROM USER WHERE id=%1").arg(personID);
    QSqlQuery query(findLabQuery);
    if (query.lastError().type() != QSqlError::NoError)
    {
        throw std::runtime_error{query.lastError().text().toStdString()};
    }
    query.next();
    return query.value(0).toString();
}

QString findOwnerLab(const QString &itemID)
{
    QString findOwnerLabQuery = QString("SELECT lab_id FROM ITEM WHERE id=%1").arg(itemID);
    QSqlQuery query(findOwnerLabQuery);
    if (query.lastError().type() != QSqlError::NoError)
    {
        throw std::runtime_error{query.lastError().text().toStdString()};
    }
    query.next();
    return query.value(0).toString();
}

QString findPersonPrivelege(const QString &personID)
{
    QString findPrivelegeQuery = QString("SELECT privelege FROM USER WHERE id=%1").arg(personID);
    QSqlQuery query(findPrivelegeQuery);
    if (query.lastError().type() != QSqlError::NoError)
    {
        throw std::runtime_error{query.lastError().text().toStdString()};
    }
    query.next();
    return query.value(0).toString();
}

QString findItemPrivelege(const QString &itemID)
{
    QString findPrivelegeQuery = QString("SELECT privelege FROM ITEM WHERE id=%1").arg(itemID);
    QSqlQuery query(findPrivelegeQuery);
    if (query.lastError().type() != QSqlError::NoError)
    {
        throw std::runtime_error{query.lastError().text().toStdString()};
    }
    query.next();
    return query.value(0).toString();
}

bool isSuccessfulQuery(const QSqlQuery &query)
{
    return query.lastError().type() == QSqlError::NoError;
}
