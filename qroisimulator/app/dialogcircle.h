#ifndef DIALOGcircle_H
#define DIALOGcircle_H

#include <QDialog>
#include <QSlider>
#include <QLineEdit>
#include <QPushButton>
#include <QCheckBox>
#include <QComboBox>
#include <QStringListModel>
#include "imgprocbase.h"

typedef struct {
    cv::Point2d center;
    double radius;
    double cPerc;
} RANSACIRCLE;


namespace Ui {
class DialogCircle;
}

class DialogCircle : public QDialog
{
    Q_OBJECT
public:
    DialogCircle(QWidget *parent);
    ~DialogCircle();

private slots:
    void changeRealtime(bool);
    void activatedComboBoxSource(int act);
    void on_pushButtonClose_clicked();
    void on_pushButtonExec_clicked();
    void updatePlayerUI(const QImage* img);
    void setValuep1(int val);
    void setEditValuep1(const QString &val);

    void on_radioButton1_clicked();
    void on_radioButton2_clicked();
    void on_radioButton3_clicked();

protected:
    void closeEvent(QCloseEvent *event);
public:
    void ExecRansacCircle(IplImage* iplImg);
    void ExecFitEllipse2(IplImage* iplImg);
    void ExecLeastSquare(IplImage* iplImg);
    void ExecCircleFit(IplImage* iplImg);
public:
    vector<RANSACIRCLE> vecRansicCircle;
    float verifyCircle(cv::Mat dt, cv::Point2f center, float radius, std::vector<cv::Point2f> & inlierSet);
    inline void getCircle(cv::Point2f& p1, cv::Point2f& p2, cv::Point2f& p3, cv::Point2f& center, float& radius);
    std::vector<cv::Point2f> getPointPositions(cv::Mat binaryImage);
    int Find_RANSAC_Circle(IplImage* grayImg);

private:
    Ui::DialogCircle *ui;
    QString mName;
    int source = 0;
    bool bRealtime = false;

    IplImage* tmp = nullptr;
    float bestCirclePercentage;
    int method = 0;
};

#endif // DIALOGcircle_H
