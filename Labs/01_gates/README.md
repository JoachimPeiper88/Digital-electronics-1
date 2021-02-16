# Nadpis 1

### De Morganove zakony

```vhdl

architecture dataflow of gates is
begin
    f_o     <= (not(b_i) and (a_i)) or ((not c_i) and (not b_i));
    fnand_o <= not((not(not b_i and a_i)) and (not((not c_i) and (not b_i))));
    fnor_o  <= (not(b_i or (not a_i))) or (not(c_i or b_i));

end architecture dataflow;

```
![DeMOrgan simulation](Images/DeMorgan_sim.png)

> URL for the simulation
https://www.edaplayground.com/x/vpgK

>Truth table 

| **c** | **b** |**a** | **f(c,b,a)** |
| :-: | :-: | :-: | :-: |
| 0 | 0 | 0 |  1|
| 0 | 0 | 1 |  1|
| 0 | 1 | 0 |  0|
| 0 | 1 | 1 |  1|
| 1 | 0 | 0 |  1|
| 1 | 0 | 1 |  1|
| 1 | 1 | 0 |  0|
| 1 | 1 | 1 |  0|