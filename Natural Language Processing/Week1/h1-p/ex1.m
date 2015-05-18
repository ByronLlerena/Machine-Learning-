%EXERCICE 1 NATURAL PROCESSING

clear; close all; clc
fprintf("Creating matrices and arrays of words types and counts..")
freq=fopen("gene.counts");
[counts,words,types,n]=emission(freq);
fprintf("\nProgram paused,press any key to continue.. \n")
pause;
fprintf("\nReplacing words with counts less than 5 counts with symbol _RARE_..\n")
[newCounts,newWords]=replaceWords(counts,words);
fprintf("\nSuccesfully replaced all unseen words with symbol _RARE_\n");
pause;

fprintf("\nProgram paused, press any key to continue..\n")

clc;


