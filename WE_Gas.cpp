#include "WE_Gas.hpp"

// Default constructor
WE_Gas::WE_Gas(QObject *parent) : QObject(parent) {}

// Increase the gas level
double WE_Gas::findKF(double p2 , double t2 , double gas_den)
{
    p2 = p2 + p1;
    t2 = t2 + 273.15;

    double num = p1 * t2 * gas_den;
    double den = p2 * t1 * air_den;

    double div = num / den ;

    double result = std::sqrt(div);

    std::cout << "KF : " << result << std::endl;
    std::cout << "p2 : " << p2 << std::endl;
    std::cout << "t2 : " << t2 << std::endl;
    std::cout << "Numerator : " << num << std::endl;
    std::cout << "Denominator : " << den << std::endl;
    std::cout << "Division : " << div << std::endl;

    return result;
}

double WE_Gas::getWE(double kg_per_hr , double kf , double gas_den)
{
    double num = kg_per_hr * kf * air_den ;

    double den = 60 * gas_den * 0.4536 * 0.075 * 4.15;

    double gpm = num / den ;

    double lpm = gpm * 3.785;

    double water_eq = lpm * 60 ;

    std::cout << "kg_per_hr : " << kg_per_hr << std::endl;
    std::cout << "kf : " << kf << std::endl;
    std::cout << "gas_den : " << gas_den << std::endl;
    std::cout << "Numerator : " << num << std::endl;
    std::cout << "Denominator : " << den << std::endl;
    std::cout << "gpm : " << gpm << std::endl;
    std::cout << "lpm : " << lpm << std::endl;
    std::cout << "water_eq in LPH : " << water_eq << std::endl;

    return water_eq;
}

double WE_Gas::getWEFromCubicMeter(double m3_per_hr, double kf)
{
    double num = m3_per_hr * kf;
    double den = 60 * 4.15 * 0.02832;

    double lpm = num / den; // L/min
    double water_eq = lpm * 3.785 * 60; // Convert L/min to L/hour (LPH)

    std::cout << "m3_per_hr : " << m3_per_hr << std::endl;
    std::cout << "kf : " << kf << std::endl;
    std::cout << "Numerator : " << num << std::endl;
    std::cout << "Denominator : " << den << std::endl;
    std::cout << "lpm : " << lpm << std::endl;
    std::cout << "water_eq in LPH : " << water_eq << std::endl;

    return water_eq;
}

double WE_Gas::getWEFromNormalCubicMeter(double nm3_per_hr, double kf)
{
    double num = nm3_per_hr * kf * 1.077;
    double den = 60 * 4.15 * 0.02832;

    double lpm = num / den;            // First compute LPM
    double water_eq = lpm * 3.785 * 60;        // Then convert to LPH

    std::cout << "nm3_per_hr : " << nm3_per_hr << std::endl;
    std::cout << "kf : " << kf << std::endl;
    std::cout << "Numerator : " << num << std::endl;
    std::cout << "Denominator : " << den << std::endl;
    std::cout << "lpm : " << lpm << std::endl;
    std::cout << "water_eq in LPH : " << water_eq << std::endl;

    return water_eq;
}

double WE_Gas::getWEFromCFH(double cfh, double kf)
{
    double num = cfh * kf;
    double den = 60 * 4.15;

    double gpm = num / den;
    double lpm = gpm * 3.785;
    double water_eq = lpm * 60;

    std::cout << "cfh : " << cfh << std::endl;
    std::cout << "kf : " << kf << std::endl;
    std::cout << "Numerator : " << num << std::endl;
    std::cout << "Denominator : " << den << std::endl;
    std::cout << "gpm : " << gpm << std::endl;
    std::cout << "lpm : " << lpm << std::endl;
    std::cout << "water_eq in LPH : " << water_eq << std::endl;

    return water_eq;
}

QString WE_Gas::getTubeBodyInfo(double waterEq, const QString &material)
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
