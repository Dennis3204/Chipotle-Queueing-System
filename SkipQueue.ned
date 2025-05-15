import org.omnetpp.queueing.Source;
import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.Fork;
import org.omnetpp.queueing.Sink;

simple MySinkExt extends Sink
{
    parameters:
        @class(MySinkExt);
        @signal[end2end](type=simtime_t);
        @statistic[end2end](title="System delay"; source=end2end; record=vector,histogram);
}

network SkipQueue
{
    @display("bgb=562,160");

    submodules:
        walkinSrc: Source {
            @display("p=50,43");
        }
        mobileSrc: Source {
            @display("p=340,115");
        }

        walkinQueue: Queue {
            @display("p=140,43;i=block/queue");
        }

        queue1: Queue {
            @display("p=250,43;i=block/queue");
        }
        queue2: Queue {
            @display("p=340,43;i=block/queue");
        }
        queue3: Queue {
            @display("p=430,43;i=block/queue");
        }

        sink: MySinkExt {
            @display("p=520,43");
        }

    connections:
        walkinSrc.out --> walkinQueue.in++;
        walkinQueue.out --> queue1.in++;
        queue1.out --> queue2.in++;
        queue2.out --> queue3.in++;
        mobileSrc.out --> queue3.in++;
        queue3.out --> sink.in++;
}
