Quantum-Inspired Decision Making Model Simualtor
======

##Introduction##

This project is aiming to develope a full simulator for Quantum-Inspired Decision Making Model (QDM).

Ultimately, this project is going to integrate a noval machine learning algorithm to support utility estimation.

This simulator is working with _2 Players (Agent)_

##Structure##

* qdmain.m: the main program which drives this simulator.
* savemain.m: provides management functionalities to dataset and datalist.
* loadFunctions
    + loadPayoff.m: will load payoff matrices for both players.
    + loadPayoffData.m: a internal function which is called by loadPayoff.m
    + loadPayoffMenu.m: provides a full menu for existed dataset.
* saveFunctions
    + savePayoffMatrix.m: can format preset payoff matrix and store as .mat data file.
    + savePayoffMenu.m: can format a full existed dataset list and save as .mat data file.
* computingFunctions
    + calculateDecisionSpace.m: verify and calculate decision space.
    + calculateHamiltonian.m: is able to construct Hamiltonian matrix based on payoff matrix.
    + calculateUtility.m: called by calculateHamiltonian.m, calculate utility based on decision.
    + transform.m: perform time dependent Schrodinger Equation.

##Some notes and Future Plan##

* This program consists some preset values.
* Need to work out how to construct HB.
* Integerate a learning system for estimating utility based on payoff matrices.

###Contacts###
Hu Yuhuang (duguyue100)

Email: duguyue100@gmail.com

Address: _No. 42, North, Flatland_
