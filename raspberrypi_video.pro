
TEMPLATE = app
QT += core gui
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = 

RPI_LIBS = ../raspberrypi_libs
LEPTONSDK = leptonSDKEmb32PUB

PRE_TARGETDEPS += sdk
QMAKE_EXTRA_TARGETS += sdk sdkclean
sdk.commands = make -C $${RPI_LIBS}/$${LEPTONSDK}
sdkclean.commands = make -C $${RPI_LIBS}/$${LEPTONSDK} clean

DEPENDPATH += .
INCLUDEPATH += . $${RPI_LIBS}

DESTDIR=.
OBJECTS_DIR=gen_objs
MOC_DIR=gen_mocs

HEADERS += leptonSDKEmb32PUB/crc16.h \
    leptonSDKEmb32PUB/LEPTON_AGC.h \
    leptonSDKEmb32PUB/LEPTON_ErrorCodes.h \
    leptonSDKEmb32PUB/LEPTON_I2C_Protocol.h \
    leptonSDKEmb32PUB/LEPTON_I2C_Reg.h \
    leptonSDKEmb32PUB/LEPTON_I2C_Service.h \
    leptonSDKEmb32PUB/LEPTON_Macros.h \
    leptonSDKEmb32PUB/LEPTON_OEM.h \
    leptonSDKEmb32PUB/LEPTON_SDK.h \
    leptonSDKEmb32PUB/LEPTON_SDKConfig.h \
    leptonSDKEmb32PUB/LEPTON_SYS.h \
    leptonSDKEmb32PUB/LEPTON_Types.h \
    leptonSDKEmb32PUB/LEPTON_VID.h \
    leptonSDKEmb32PUB/raspi_I2C.h \
    SPI.h \
    Lepton_I2C.h \
    LeptonThread.h \
    MyLabel.h \
    OutlineLabel.h \
    Palettes.h

SOURCES += SPI.cpp \
    leptonSDKEmb32PUB/crc16fast.c \
    leptonSDKEmb32PUB/LEPTON_AGC.c \
    leptonSDKEmb32PUB/LEPTON_I2C_Protocol.c \
    leptonSDKEmb32PUB/LEPTON_I2C_Service.c \
    leptonSDKEmb32PUB/LEPTON_OEM.c \
    leptonSDKEmb32PUB/LEPTON_SDK.c \
    leptonSDKEmb32PUB/LEPTON_SYS.c \
    leptonSDKEmb32PUB/LEPTON_VID.c \
    leptonSDKEmb32PUB/raspi_I2C.c \
    Lepton_I2C.cpp \
    LeptonThread.cpp \
    main.cpp \
    MyLabel.cpp \
    OutlineLabel.cpp \
    Palettes.cpp

unix:LIBS += -L$${RPI_LIBS}/$${LEPTONSDK}/Debug -lLEPTON_SDK

unix:QMAKE_CLEAN += -r $(OBJECTS_DIR) $${MOC_DIR}

DISTFILES += \
    leptonSDKEmb32PUB/Debug/libLEPTON_SDK.a

