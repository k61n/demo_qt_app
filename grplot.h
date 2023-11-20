#ifndef GRPLOT_H
#define GRPLOT_H

#include "grwidget.h"

class GrPlot : public GRWidget
{
public:
    GrPlot();

protected:
    virtual void draw();
};

#endif // GRPLOT_H
