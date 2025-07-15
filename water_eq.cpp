#include "water_eq.hpp"
#include <iostream>
#include <iomanip>
#include <cmath>

WaterEq::WaterEq(QObject *parent) : QObject(parent)
{
    std::cout << PACKAGE << " Logger Level Set to info" << std::endl;

    std::cout << "WEQ" << getWaterEq(10000,1120,8.02,"kg/Hr","kg/m3") << std::endl;
}

double WaterEq::getWaterEq(double maxFlow, double densityLiquid, double densityFloat , QString flow_unit , QString densityL_unit)
{
    std::cout << "maxFlow is" << maxFlow << std::endl;
    std::cout << "densityLiquid is" << densityLiquid << std::endl;
    std::cout << "densityFloat is" << densityFloat << std::endl;
    std::cout << "flow_unit is" << flow_unit.toStdString() << std::endl;
    std::cout << "densityL_unit is" << densityL_unit.toStdString() << std::endl;

    if (densityL_unit.compare("kg/m^3", Qt::CaseInsensitive) == 0 )
    {
        std::cout << "here1456" << std::endl;
        densityLiquid = densityLiquid / 1000;
    }

    if (flow_unit.compare("Kg/Hr", Qt::CaseInsensitive) == 0 )
    {
        std::cout << "here123" << std::endl;

        maxFlow = maxFlow / (densityLiquid);
        // densityLiquid = densityLiquid / 1000;
    }

    if(flow_unit.toStdString() == "m3/Hr" && densityL_unit.toStdString() == "kg/m^3")
    {
        maxFlow = maxFlow * 1000;
    }



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

void WaterEq::resetPassword(const QString &username, const QString &question,
                            const QString &answer, const QString &newPassword)
{
    if (username == validUsername &&
        question == securityQuestion &&
        answer.trimmed() == securityAnswer) {

        validPassword = newPassword;
        emit passwordResetResult(true, "Password updated successfully.");
    } else {
        emit passwordResetResult(false, "Incorrect answer to the security question.");
    }
}

QString WaterEq::getTubeBodyInfo(double waterEq, const QString &material)
{
    struct Range {
        double min;
        double max;
        QString tube;
        QString body;
    };

    QList<Range> ranges;

    if (material == "SS-316") {
        ranges = {
            {3, 30, "PG-1", "30 dia"},
            {6, 60, "PG-2", "30 dia"},
            {10, 100, "PG-3", "30 dia"},
            {16, 160, "PG-4", "38 dia"},
            {25, 250, "PG-5", "38 dia"},
            {40, 400, "PG-6", "38 dia"},
            {60, 600, "PG-7", "43 dia"},
            {60, 600, "PG-8", "57 dia"},
            {100, 1000, "PG-9", "57 dia"},
            {160, 1600, "PG-10", "57 dia"},
            {250, 2500, "PG-11", "57 dia"},
            {400, 4000, "PG-14", "72 dia"},
            {600, 6000, "PG-16", "96 dia"},
            {1000, 10000, "PG-17", "102 dia"},
            {2000, 20000, "PG-17", "102 dia"},
            {3000, 30000, "PG-17", "102 dia"}
        };
    } else if (material == "PTFE(Teflon)") {
        ranges = {
            {1.2, 12, "PG-1", "30 dia"},
            {2.5, 25, "PG-2", "30 dia"},
            {4, 40, "PG-3", "30 dia"},
            {7, 70, "PG-4", "38 dia"},
            {10, 100, "PG-5", "38 dia"},
            {16, 160, "PG-6", "38 dia"},
            {24, 240, "PG-7", "43 dia"},
            {24, 240, "PG-8", "57 dia"},
            {40, 400, "PG-9", "57 dia"},
            {64, 640, "PG-10", "57 dia"},
            {100, 1000, "PG-11", "57 dia"},
            {160, 1600, "PG-14", "72 dia"},
            {250, 2500, "PG-16", "96 dia"},
            {400, 4000, "PG-17", "102 dia"},
            {800, 8000, "PG-17", "102 dia"},
            {1200, 12000, "PG-17", "102 dia"}
        };
    }

    for (const Range &range : ranges) {
        if (waterEq >= range.min && waterEq < range.max) {
            return QString("Tube: %1, Body: %2").arg(range.tube, range.body);
        }
    }

    return "No matching range found";
}

// QString WaterEq::getTubeBodyInfo(double waterEq)
// {
//     struct Range {
//         double min;
//         double max;
//         QString tube;
//         QString body;
//     };

//     QList<Range> ranges = {
//                            {0, 30, "PG-1", "30 dia"},
//                            {30, 60, "PG-2", "30 dia"},
//                            {60, 100, "PG-3", "30 dia"},
//                            {100, 160, "PG-4", "38 dia"},
//                            {160, 280, "PG-5", "38 dia"},
//                            {280, 400, "PG-6", "38 dia"},
//                            {400, 600, "PG-7", "43 dia"},
//                            {600, 1000, "PG-9", "57 dia"},
//                            {1000, 1600, "PG-10", "57 dia"},
//                            {1600, 2500, "PG-11", "57 dia"},
//                            {2500, 3000, "PG-12/PG-13", "72 dia"},
//                            {3000, 4000, "PG-14", "72 dia"},
//                            {4000, 6000, "PG-16", "96 dia"},
//                            {6000, 20000, "PG-17", "102 dia"},
//                            {20000, 30000, "PG-17", "102 dia"},
//                            };

//     for (const Range &range : ranges) {
//         if (waterEq >= range.min && waterEq < range.max) {
//             return QString("Tube: %1, Body: %2").arg(range.tube, range.body);
//         }
//     }

//     return "No matching range found";
// }
