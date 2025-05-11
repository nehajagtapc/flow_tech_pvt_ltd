#include "WE_Gas.hpp"

// Default constructor
WE_Gas::WE_Gas(QObject *parent) : QObject(parent) {}

// Increase the gas level
double WE_Gas::findKF(double p2 , double t2 , double gas_den)
{
    p2 = p2 + p1;
    t2 = t2 + t1;

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

