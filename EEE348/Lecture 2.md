### Overview of VLSI Design

VLSI: Very Large Scale Integration



### Requirement:

- algorithmic design and modelling
- architectural organisation
- detailed design
- verification
- physical implementation



VLSI Design is also a combination of:

- semiconductor materials and device design
- process engineering
- fabrication,test and metrology equipment development
- advances in lithography
- packaging
- etc.





### CMOS inverter

![img](https://courseware.ee.calpoly.edu/~dbraun/courses/ee307/F02/02_Sales/Image1.gif)



When VIN is low, the NMOS is "off", while the PMOS stays "on": instantly charging VOUT to logic high. When Vin is high, the NMOS is "on and the PMOS is "on: draining the voltage at VOUT to logic low.

This model of the CMOS inverter helps to describe the inverter conceptually, but does not accurately describe the voltage transfer characteristics to any extent. A more full description employs more calculations and more device states.

| MOSFET | Condition on MOSFET | State of MOSFET |
| ------ | ------------------- | --------------- |
| NMOS   | Vgs<Vtn             | OFF             |
| NMOS   | Vgs>Vtn             | ON              |
| PMOS   | Vsg<Vtp             | OFF             |
| PMOS   | Vsg>Vtp             | ON              |

