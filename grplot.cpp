#include "grplot.h"
#include "gr.h"

GrPlot::GrPlot() : GRWidget()
{
}

void GrPlot::draw()
{
    double x[] = {0.1, 0.9, 0.9, 0.1, 0.1};
    double y[] = {0.1, 0.1, 0.9, 0.9, 0.1};
    gr_polyline(5, x, y);
}
