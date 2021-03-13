
# Shiny application that predict the risk of death in very low birth weight newborns
## Context
Neonatal mortality is a major health concern worldwide, and one of the groups of babies that has contributed most to this outcome are the very low birth weight newborns. Thus, knowing the variables that most contribute to the mortality of these newborns, as well as calculating their risk of death has become an important issue, as they may facilitate decision making by health professionals in procedure and treatment to follow. In this context, the theme of this project appeared, whose main objective was to develop a logistic regression model, which works as a classifier and which will predict whether a particular newborn weighing less than 1500 grams will survive or die. To facilitate its use, a shiny application was created, in which the model was implemented.

## Shiny application structure
The Shiny application developed for this work has an environment organized in 3 tabs, each with its own purpose:<br/>

**Home Page:** The first tab of the application's navigation bar corresponds to the application's home page, which shows only the application title.<br/>

**About:** In the second tab for the application is where is explained the purpose of the application, the authors responsible for its development, the tools used for its construction, as well as a brief description of the model / algorithm implemented in it. In the part of the model description, the accuracy of the model is presented, the AUC values for internal and external validation and the variables that are part of the model, accompanied by a short description of which values and metrics can be used for each one.<br/>

**Prevision:** In the “Prevision” tab of the Shiny application is where the prevision is calculated, in real time, if a particular very low birth weight newborn will survive or die. Here you should fill the form with the information of the baby that you want to know what will be the probability of dying. After clicking on the calculate button, the application returns the probable admission status of that baby and the percentage of risk of death. This application is configured so that values equal to or greater than 63%, will indicate that the baby will die.

