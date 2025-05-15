#include "MySinkExt.h"

Define_Module(MySinkExt);

void MySinkExt::initialize()
{

    Sink::initialize();
    delayHist.setName("end2endHist");
    delayVec.setName("end2end");
}

void MySinkExt::handleMessage(cMessage *msg)
{

    simtime_t d = simTime() - msg->getCreationTime();

    emit(registerSignal("end2end"), d);


    delayVec.record(d);
    delayHist.collect(d);


    Sink::handleMessage(msg);
}

void MySinkExt::finish()
{

    delayHist.recordAs("end2endHist");
    Sink::finish();
}
