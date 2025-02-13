#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QIcon>
#include <QtQml>
#include "water_eq.hpp"

int main(int argc, char *argv[]) {
    QGuiApplication a(argc, argv);
   // a.setWindowIcon(QIcon(":/images/flowtech_logo.png"));

    QQmlApplicationEngine engine;

    // Register WaterEq as a QML type
    qmlRegisterType<WaterEq>("WaterEq", 1, 0, "WaterEq");

    // Determine the absolute path of the QML file based on the relative path
    QString basePath = QCoreApplication::applicationDirPath(); // Directory of the executable
    QString mainQmlPath = basePath + "/flow_tech_project/Main.qml";
    const QUrl url(QStringLiteral("file:///%1").arg(mainQmlPath));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &a, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl)
                             QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);

    engine.load(url);

    return a.exec();
}
