// Dining‑In: Source → q1 → cook1 → q2 → cook2 → q3 → cook3 → q4 → cashier → q5 → seating → sink
//
// Every “cook*”/cashier/seating stage is just a Delay module so we can
// give it a deterministic service time (same trick you used for the 2.2 s delay).

// Import the same queueing primitives you already use
import org.omnetpp.queueing.Source;
import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.Delay;
import org.omnetpp.queueing.Sink;

// ---- Custom sink identical to yours ---------------------------------


network DiningIn
{
    @display("bgb=650,160");
    submodules:
        src: Source { @display("p=60,80"); }

        queue:  Queue { @display("p=140,80;i=block/queue"); }
        queue1: Queue { @display("p=230,80;i=block/queue"); }
        queue2: Queue { @display("p=320,80;i=block/queue"); }
        queue3: Queue { @display("p=410,80;i=block/queue"); }
        queue4: Queue { @display("p=500,80;i=block/queue"); }

        sink: MySinkExt { @display("p=590,80"); }

    connections:
        src.out   --> queue.in++;
        queue.out --> queue1.in++;
        queue1.out --> queue2.in++;
        queue2.out --> queue3.in++;
        queue3.out --> queue4.in++;
        queue4.out --> sink.in++;
}
