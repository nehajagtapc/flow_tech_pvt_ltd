#ifndef WATER_EQ_HPP
#define WATER_EQ_HPP

#include <QObject>
#include <cmath>
#include <iostream>
#include <iomanip>

struct TubeBodyInfo {
    QString tube;
    QString body;
};

class WaterEq : public QObject
{
    Q_OBJECT
public:
    explicit WaterEq(QObject *parent = nullptr);

  //  Q_INVOKABLE double getWaterEq(double maxFlow, double densityLiquid, double densityFloat,QString flow_unit , QString densityL_unit,QString densityF_unit);
    Q_INVOKABLE double getWaterEq(double maxFlow, double densityLiquid, double densityFloat, QString flow_unit , QString densityL_unit);

    Q_INVOKABLE double getfloatDensity(double float_weight , double water_weight);
    Q_INVOKABLE bool setPrecision(int value);
    //Q_INVOKABLE QString getTubeBodyInfo(double waterEq);
    Q_INVOKABLE QString getTubeBodyInfo(double waterEq, const QString &material);



    Q_INVOKABLE bool checkCredentials(const QString &username, const QString &password);

    Q_INVOKABLE void resetPassword(const QString &username, const QString &question,
                                   const QString &answer, const QString &newPassword);




signals:
    void credentialsChecked(bool valid);  // Signal to notify when the credentials are checked
    void passwordResetResult(bool success, const QString &message);

private:
    QString validUsername = "admin";  // Hardcoded valid username
    QString validPassword = "password123";  // Hardcoded valid password
    QString securityQuestion = "What is your lucky number?";
    QString securityAnswer = "7";

private:
    int precision{3};
    std::string PACKAGE{"WaterEq :"};
};

#endif // WATER_EQ_HPP
