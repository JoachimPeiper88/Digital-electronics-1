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
![DeMOrgan simulation](images/DeMorgan_sim.png)

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

# Distributive laws 

```vhdl
architecture dataflow of gates is
begin
    f1_o  <= (x_i and y_i)or(x_i and z_i);
    f2_o  <= x_i and (y_i or z_i);
    f3_o  <= (x_i or y_i) and (x_i or z_i);
    f4_o  <= x_i or (y_i and z_i);
    

end architecture dataflow;

```

![Distribution law](images/Distrbution_law.png)

>URL for the simulation
https://www.edaplayground.com/x/bWHd

