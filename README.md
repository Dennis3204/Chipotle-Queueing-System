# Chipotle Service Queue Simulation

## Overview

This project evaluates the efficiency of different queuing systems at a Chipotle Mexican Grill. The goal was to simulate customer wait times across three designs using Omnet++, and determine which configuration results in the shortest average total time over a 6-hour period.

---

>  **Note:** This project requires the [`queueinglib`](https://doc.omnetpp.org/omnetpp/manual/#sec:queueinglib) library from OMNeT++ to run the simulation files.  
> Make sure it is **enabled in your project configuration** (`.nedfolders` and `Makefile`) before compiling.

## Designs Simulated

### Design 1: Dining-In Queue (Baseline)
- All customers order and dine in.
- Includes seating delay.
- Arrival rate: 1 customer every 45 seconds.

### Design 2: Takeout Queue
- All customers are takeout orders.
- No seating delay.
- Arrival rate: 1 customer every 45 seconds.

### Design 3: Mobile App Priority Queue
- Mobile orders skip the line.
- Walk-in and mobile customers arrive at different rates.
- Walk-in arrival: every 56.25 seconds  
- Mobile arrival: every 225 seconds

---

## Methodology

- Simulations were run using custom queue logic in a discrete-event simulation environment (Omnet++).
- Each customer passed through multiple service stages: Tortilla, Protein, Toppings, and Cashier. Dine-In orders included a final Seating stage.
- Stochastic service times were modeled using expected values (E[X₁] ... E[X₅]) based on source data.
- Both **simulated** and **theoretical** average delays were calculated for each queue.
- Confidence intervals (95%) were computed using averages from 10 independent simulation runs to analyze consistency and variability.

---

## Results Summary

### Detailed Simulation & Theoretical Delays

| Alternative Designs        | Dining-In Queue (Simulation) | Dining-In Queue (Theoretical) | Takeout Queue (Simulation) | Takeout Queue (Theoretical) | Mobile Queue (Simulation) | Mobile Queue (Theoretical) |
|----------------------------|------------------------------|-------------------------------|-----------------------------|------------------------------|----------------------------|-----------------------------|
| Average Delay (Queue)      | 22.3611 seconds              | 31.25 seconds                 | 26.8198 seconds             | 31.25 seconds                | 23.4821 seconds            | 22.5 seconds                |
| Average Delay (Queue 1)    | 11.2314 seconds              | 16 seconds                    | 25.8706 seconds             | 16 seconds                   | 10.1423 seconds            | 11.25 seconds               |
| Average Delay (Queue 2)    | 263.235 seconds              | 320 seconds                   | 280.952 seconds             | 320 seconds                  | 119.875 seconds            | 89.28 seconds               |
| Average Delay (Queue 3)    | 38.7796 seconds              | 60 seconds                    | 47.3984 seconds             | 60 seconds                   | 58.0923 seconds            | 60 seconds                 |
| Average Delay (Queue 4)    | 7.7368 seconds               | 7.5 seconds                   | N/A                         | N/A                          | N/A                        | N/A                         |

---

### Summary Statistics (10 Runs Averaged)

<h4>Confidence Interval Chart: </h4>

<p align="left">
  <img src="https://github.com/Dennis3204/Chipotle-Queueing-System/blob/main/Confidence%20Interval%20Chart.png?raw=true" 
       alt="Confidence Interval Chart" 
       style="width: 600px;" />
</p>

<br>

| Design   | Avg Total Time (sec) | Std Dev | 95% CI (Lower - Upper) |
|----------|-----------------------|---------|--------------------------|
| Design 1 | 357.709               | 129.4   | 281.107 – 434.296       |
| Design 2 | 366.976               | 60.6    | 333.251 – 400.691       |
| Design 3 | 216.27                | 55.96   | 191.614 – 253.278       |



---

## Conclusion

- Design 3 (Mobile App Priority) was the most efficient, cutting average wait times by over 140 seconds compared to the others.
- Design 1 had the highest variability in wait times.
- Optimizing queue flow and giving priority to mobile users significantly improved overall service time.

---

## References

[1] R. Sahni, "Chipotle Queuing System," *Academia.edu*, Nov. 22, 2013. [Online]. Available: [https://www.academia.edu/5191558/Chipotle_Queuing_System](https://www.academia.edu/5191558/Chipotle_Queuing_System)


---

## Author

Dennis Ren  
CPE 345 – Final Project  
Professor Welikala
