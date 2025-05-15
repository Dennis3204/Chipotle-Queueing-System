import org.omnetpp.queueing.Source;
import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.Delay;
import org.omnetpp.queueing.Sink;

// ---- Custom sink identical to yours ---------------------------------


network TakeOut
{
    @display("bgb=560,160");
    submodules:
        src: Source { @display("p=60,80"); }

        queue:  Queue { @display("p=140,80;i=block/queue"); }
        queue1: Queue { @display("p=230,80;i=block/queue"); }
        queue2: Queue { @display("p=320,80;i=block/queue"); }
        queue3: Queue { @display("p=410,80;i=block/queue"); }

        sink: MySinkExt { @display("p=500,80"); }

    connections:
        src.out   --> queue.in++;
        queue.out --> queue1.in++;
        queue1.out --> queue2.in++;
        queue2.out --> queue3.in++;
        queue3.out --> sink.in++;
}