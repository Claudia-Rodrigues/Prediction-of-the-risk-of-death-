
# Shiny application that predicts the risk of death in very low birth weight newborns
## Context
Neonatal mortality is a major health concern worldwide, and one of the groups of babies that has contributed most to this outcome are the very low birth weight newborns. Thus, knowing the variables that most contribute to the mortality of these newborns, as well as calculating their risk of death has become an important issue, as they may facilitate decision making by health professionals in procedure and treatment to follow. In this context, the theme of this project appeared, whose main objective was to develop a logistic regression model, which works as a classifier and which will predict whether a particular newborn weighing less than 1500 grams will survive or die. To facilitate its use, a shiny application was created, in which the model was implemented.

## Shiny application structure
The Shiny application developed for this work has an environment organized in 3 tabs, each with its own purpose:<br/>

**`Home Page:`** The first tab of the application's navigation bar corresponds to the application's home page, which shows only the application title.<br/>

<p align ="center">
  <img src="https://github.com/Claudia-Rodrigues/Risk-of-death-VLBWNM/blob/main/image/HomePage.PNG" width="650" height="300" />

**`About:`** In the second tab for the application is where is explained the purpose of the application, the authors responsible for its development, the tools used for its construction, as well as a brief description of the model / algorithm implemented in it. In the part of the model description, the accuracy of the model is presented, the AUC values for internal and external validation and the variables that are part of the model, accompanied by a short description of which values and metrics can be used for each one.<br/>

<p align ="center">
  <img src="https://github.com/Claudia-Rodrigues/Risk-of-death-VLBWNM/blob/main/image/About.PNG" width="650" height="300" />

**`Prevision:`** In the “Prevision” tab of the Shiny application is where the prevision is calculated, in real time, if a particular very low birth weight newborn will survive or die. Here you should fill the form with the information of the baby that you want to know what will be the probability of dying. After clicking on the calculate button, the application returns the probable admission status of that baby and the percentage of risk of death. This application is configured so that values equal to or greater than 63%, will indicate that the baby will die.

<p align ="center">
  <img src="https://github.com/Claudia-Rodrigues/Risk-of-death-VLBWNM/blob/main/image/Prevision.PNG" width="650" height="300" />
  
## How to use the Shiny application
1. Make sure you have the following tools installed in your desktop:
- [x] <a href="https://www.r-project.org/">R</a>
- [x] <a href="https://rstudio.com/">RStudio</a>

2. Download my application code by clicking on **Code** and then in **Download ZIP** and extract the files

3. In RStudio, go to the **File** menu and click on **New Project**. In the New Project Wizard window, select the **Existing Directory** option. Then, click in the **Browser** button and select the path where you saved the file with the code. Select path to folder **"model_VLBWNB"** and click in **Create Project**. Click on the **server.R** and **ui.R** scripts and on the **styles.css** script located inside the www folder. Finally, click on the **Run App** button. 

<p align ="center">
  <img src="https://github.com/Claudia-Rodrigues/Risk-of-death-VLBWNM/blob/main/image/procedure.PNG" width="650" height="300" />
