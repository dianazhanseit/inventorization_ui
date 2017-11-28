#ifndef COMMONQUERIES_H
#define COMMONQUERIES_H

#include <QString>
#include <QSqlQuery>
#include <QSqlError>

bool itemExists(const QString& itemID);
bool userExists(const QString& personID);
bool isBorrowed(const QString& itemID);
QString findAssociatedLab(const QString& personID);
QString findPersonPrivelege(const QString& personID);
QString findItemPrivelege(const QString& itemID);
QString findOwnerLab(const QString& itemID);

bool isSuccessfulQuery(const QSqlQuery& query);

#endif // COMMONQUERIES_H
