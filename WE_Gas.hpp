#ifndef WE_GAS_H
#define WE_GAS_H

#include <QObject>
#include <iostream>
#include <cmath>

class WE_Gas : public QObject {
    Q_OBJECT

public:
    explicit WE_Gas(QObject *parent = nullptr);  // Updated constructor

    Q_INVOKABLE double findKF(double p2, double t2, double gas_den);
    Q_INVOKABLE double getWE(double kg_per_hr, double kf, double gas_den);

private:
    double p1{1.032};           // Pressure in kg/cm²
    double t1{294.5};           // Temperature in Kelvin
    double air_den{1.2928};     // Air density in kg/m³
};

#endif // WE_GAS_H
