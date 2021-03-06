
QT       += core
QT       += gui
QT       += xml
QT       += widgets
QT       += multimedia
QT       += multimediawidgets
QT       += opengl

win32 {

DEFINES += Q_OS_WIN
LIBS += -L"..\winlib"

CONFIG(debug, debug|release) {
#LIBS += -lopencv_core320d -lopencv_imgproc320d -lopencv_highgui320d -lopencv_videoio320d -lopencv_imgcodecs320d
LIBS += -lopencv_world340d
LIBS += "..\winlib\Debug\qroilib.lib"
LIBS += "..\winlib\Debug\jpeg.lib"
LIBS += "..\winlib\Debug\png.lib"
LIBS += "..\winlib\Debug\zlib.lib"
LIBS += "..\winlib\Debug\lcms2.lib"
}
CONFIG(release, debug|release) {
#LIBS += -lopencv_core320 -lopencv_imgproc320 -lopencv_highgui320 -lopencv_videoio320  -lopencv_imgcodecs320
LIBS += -lopencv_world340
LIBS += "..\winlib\Release\qroilib.lib"
LIBS += "..\winlib\Release\jpeg.lib"
LIBS += "..\winlib\Release\png.lib"
LIBS += "..\winlib\Release\zlib.lib"
LIBS += "..\winlib\Release\lcms2.lib"
}
LIBS += -lws2_32

INCLUDEPATH += "..\winlib\include"
INCLUDEPATH += "..\qroilib\pthread"
TARGET = ../../bin/qroiviewer
}

linux {
QMAKE_CXXFLAGS += -std=c++11 -pthread
LIBS += -ljpeg -lexiv2 -lpng -lz -llcms2 -lX11 -lGLU
LIBS += -L/usr/local/lib
LIBS += -L/usr/lib
LIBS += -lopencv_core
LIBS += -lopencv_imgproc
LIBS += -lopencv_highgui
LIBS += -lopencv_videoio
LIBS += -lopencv_imgcodecs
LIBS += -lopencv_ml
LIBS += -lgstreamer-1.0
LIBS += -lgobject-2.0
LIBS += -lglib-2.0
LIBS += -lv4l2
LIBS += -lqroilib

INCLUDEPATH += /usr/local/include
TARGET = ../bin/qroiviewer
}

#LDFLAGS=-L # is this even necessary?

TEMPLATE = app

INCLUDEPATH += . \
   ./app \
   ../qroilib \
   ../qroilib/engine \
   ../qroilib/qroilib \
   ../qroilib/qroilib/document \
   ../qroilib/qroilib/roilib \
   ../qroilib/qtpropertybrowser/src \
   ../serial \


# Input

HEADERS +=  \
        app/mainwindow.h \
        app/viewmainpage.h \
        app/common.h \

SOURCES +=  \
        app/main.cpp \
        app/mainwindow.cpp \
        app/viewmainpage.cpp \
        app/common.cpp \


RESOURCES +=

