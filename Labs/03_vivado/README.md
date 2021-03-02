# Vivado tutorial
## Project creation 

1.After launching Vivado executable, we can create a new project by either going through File > Project > New or the same thing can be done through Qucik Start
![create project](images/tut1.png)

2.By clicking Next we come to a window, where we select project name and its location, then we select a project type. Most of the time we use RTL Project.
![name and save](images/tut2.png)

3.We add sources by clicking on Create File. Here we can choose its name and especially the langugage we work in. In our case it is VHDL.
![VHDL](images/tut3.png)

4.Next we choose the Defalut Part. Here we can switch to Boards and select our preferred board or we add a new one by clicking Install/Update Boards. However, we can manually add new board by extracting it to a certain directory.
We accept the changes by pressing the Finish button.
![Boards](images/tut4.png)

## Adding source file, adding testbench file

1.When we had successfuly created a new project, we can find it in Design Sources > "Its name".
![Design sources](images/tut5.png)

2.When it comes to adding source files, we do that in the upper left corner by pressing File > Add sources > Add/Create simulation/design source. We repeat the same process just like in "Project Creation" step no. 3.
![Add sources](images/tut6.png)

## Running the project

1.We run the project by simply clicking on Flow in the toolmenu, then Run Simulation and finally Run Behavioral Simulation. 