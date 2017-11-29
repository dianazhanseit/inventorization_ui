#ifndef SEARCHSERVER_H
#define SEARCHSERVER_H

#include <QQuickItem>
#include <QVariantList>

class searchServer : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(QVariantList searchResult READ getSearchResult NOTIFY searchResultChanged)
    QVariantList searchResult;
public:
    searchServer();

signals:
    void searchResultChanged();

public slots:
    QVariantList getSearchResult();

    void searchByName(const QString& labID, const QString& name, bool exactMatch, bool globalSearch);
    void searchByID(const QString& labID, const QString& itemID, bool globalSearch);
};

#endif // SEARCHSERVER_H
