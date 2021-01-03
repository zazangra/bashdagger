# Bashdagger
Simple Dag creator written in bash

The present program is a work for uni. Its only purpose is to show that a certain formalization of binary DAGs is actually computable

## How it works

The process is the simplest. Given some inputs, bashdagger will the print set of vertices, edges, atomic structural equations and values for a DAG. It will also do a basic intervention

1. Variable Input
 - Write all your variables names separed by space and press enter. Then write for each variable its value (either 1 or 0)
2. Edges Construction
 - You willl first be asked for each variable if it is an edgend. Type "y" if it is, "n" otherwise. If you tipe "y 3", then the node will have 3 edges 
   stemming from. If it has only 1, simply type "y".
 - Same procedure for endpoints. "n" will mean that the variable is exogenous. "y" that only one arrow points at it and "y n" that n arrows do.
 - You will now be asked to wich is the endpoint for each edgend. Write one variable per time.
3. Do do()
 - Here you can ask to do your intervention. Write the name of the variable you want to do() and then its new value. The output will be a brand new DAG.

 
 ## Implementations
  There are tons of it. Nevertheless, I think it does the job it is written for. Some usefull features may be:
  1. Show all structural equation. This would require bashdagger to be able to recognize directed paths.
  2. Nicer output for E set, with pairs of the form: <V, EM>, <V →>
  3. Thinking of implementation for real values and probabilities. But why? Such work would be mastodontic
  
  The code itself is written by a noob, so it could be cleaner and nicer, no doubts about it. Some choiches may seem cheaty or cumbersome by an expert of bash. But, again, bashdagger 
  correctly does its job.
