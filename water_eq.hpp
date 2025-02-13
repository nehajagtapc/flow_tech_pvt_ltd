#ifndef WATER_EQ_HPP
#define WATER_EQ_HPP

#include <QObject>
#include <cmath>
#include <iostream>
#include <iomanip>

class WaterEq : public QObject
{
    Q_OBJECT
public:
    explicit WaterEq(QObject *parent = nullptr);

    Q_INVOKABLE double getWaterEq(double maxFlow, double densityLiquid, double densityFloat);
    Q_INVOKABLE double getfloatDensity(double float_weight , double water_weight);
    Q_INVOKABLE bool setPrecision(int value);

    Q_INVOKABLE bool checkCredentials(const QString &username, const QString &password);


signals:
    void credentialsChecked(bool valid);  // Signal to notify when the credentials are checked

private:
    QString validUsername = "admin";  // Hardcoded valid username
    QString validPassword = "password123";  // Hardcoded valid password

private:
    int precision{3};
    std::string PACKAGE{"WaterEq :"};
};

#endif // WATER_EQ_HPP
