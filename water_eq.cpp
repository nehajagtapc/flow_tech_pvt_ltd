#include "water_eq.hpp"
#include <iostream>
#include <iomanip>
#include <cmath>

WaterEq::WaterEq(QObject *parent) : QObject(parent)
{
    std::cout << PACKAGE << " Logger Level Set to info" << std::endl;
}

double WaterEq::getWaterEq(double maxFlow, double densityLiquid, double densityFloat)
{
    try {
        double num = (densityFloat - 1) * densityLiquid;
        double den = (densityFloat - densityLiquid);
        double div = num / den;
        double sqrt_ = sqrt(div);
        double we = maxFlow * sqrt_;

        std::cout << std::fixed << std::setprecision(precision);
        std::cout << PACKAGE << " WaterEq result = " << we << std::endl;
        return we;
    } catch (const std::exception &e) {
        std::cout << PACKAGE << " getWaterEq : Error " << e.what() << std::endl;
        return 0;
    }
}

double WaterEq::getfloatDensity(double float_weight, double water_weight)
{
    try {
        double density = float_weight / water_weight;

        std::cout << std::fixed << std::setprecision(precision);
        std::cout << PACKAGE << " Float Density = " << density << std::endl;
        return density;
    } catch (const std::exception &e) {
        std::cout << PACKAGE << " getfloatDensity : Error " << e.what() << std::endl;
        return 0;
    }
}

bool WaterEq::setPrecision(int value)
{
    try {
        std::cout << PACKAGE << " Precision level set to " << value << std::endl;
        precision = value;
        return true;
    } catch (const std::exception &e) {
        std::cout << PACKAGE << " setPrecision : Error " << e.what() << std::endl;
        return false;
    }
}

bool WaterEq::checkCredentials(const QString &username, const QString &password)
{
    bool valid = (username == validUsername && password == validPassword);
    emit credentialsChecked(valid);  // Emit signal when the credentials are checked
    return valid;
}
