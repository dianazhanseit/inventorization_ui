#include "searchserver.h"
#include <QSqlError>
#include <QSqlQuery>
#include <QString>
#include <QDebug>
#include "commonqueries.h"

searchServer::searchServer()
{

}

QVariantList searchServer::getSearchResult()
{
    return searchResult;
}

void searchServer::searchByName(const QString& labID, const QString &name, bool exactMatch, bool globalSearch)
{
    QString search;
    if (exactMatch && globalSearch)
    {
        search = QString("SELECT ITEM.name, ITEM.id, LAB.name "
                         "FROM ITEM INNER JOIN LAB ON ITEM.lab_id = LAB.id "
                                   "LEFT OUTER JOIN BORROWING ON ITEM.id = BORROWING.item_id "
                         "WHERE ITEM.name=\"%1\" and (BORROWING.returned IS NULL OR BORROWING.returned = true)").arg(name);
    }
    else if (exactMatch && !globalSearch){
        search = QString("SELECT ITEM.name, ITEM.id, LAB.name "
                         "FROM ITEM INNER JOIN LAB ON ITEM.lab_id = LAB.id "
                                   "LEFT OUTER JOIN BORROWING ON ITEM.id = BORROWING.item_id "
                         "WHERE ITEM.name = \"%1\" and (BORROWING.returned IS NULL OR BORROWING.returned = true) AND LAB.id = %2").arg(name, labID);
    }
    else if (!exactMatch && globalSearch) {
        search = QString("SELECT ITEM.name, ITEM.id, LAB.name "
                         "FROM ITEM INNER JOIN LAB ON ITEM.lab_id = LAB.id "
                                   "LEFT OUTER JOIN BORROWING ON ITEM.id = BORROWING.item_id "
                         "WHERE ITEM.name LIKE (\"%%1%\") and (BORROWING.returned IS NULL OR BORROWING.returned = true)").arg(name);
    }
    else /* !exactMatch && !globalSearch */{
        search = QString("SELECT ITEM.name, ITEM.id, LAB.name "
                         "FROM ITEM INNER JOIN LAB ON ITEM.lab_id = LAB.id "
                                   "LEFT OUTER JOIN BORROWING ON ITEM.id = BORROWING.item_id "
                         "WHERE ITEM.name LIKE (\"%%1%\") and (BORROWING.returned IS NULL OR BORROWING.returned = true) AND LAB.id = %2").arg(name, labID);
    }
    qDebug() << search;

    QSqlQuery searchQuery(search);

    if (!isSuccessfulQuery(searchQuery))
    {
        throw std::runtime_error{searchQuery.lastError().text().toStdString()};
    }

    QVariantList newSearchResult;
    while (searchQuery.next())
    {
        auto& query = searchQuery;
        QVariantMap map;
        map["itemID"] = query.value(0);
        map["itemName"] = query.value(1);
        map["labName"] = query.value(2);
        newSearchResult.push_back(map);
    }

    if (searchResult != newSearchResult)
    {
        searchResult = std::move(newSearchResult);
        searchResultChanged();
    }
}

void searchServer::searchByID(const QString& labID, const QString& itemID, bool globalSearch)
{

}
