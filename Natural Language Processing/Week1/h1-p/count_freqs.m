function[countsWords, words,typesWords,counts1Gram,types1Gram,counts2Gram,types2Gram,counts3Gram,type3Gram]=count_freqs(data);


countsWords=0;
words={};
typesWords={}
counts1Gram=0;
types1Gram={};
counts2Gram=0;
types2Gram={};
counts3Gram=0;
types3Gram={};
line1=0
line2=0;
arreglo1=0;
arreglo2=0;
aux1="**";
aux0="*";
fseek(data,0,-1);
compare1=0;
compare2=0;
n=1;



%I take the forst two lines

line1=fgetl(data);
line2=fgetl(data);

while(line1!=-1 || line2!=-1)
%I verify first if its the end of  sentence

    if(line1!=-1&&line2!=-1)%Both lines are in the same sentence
    

        arreglo1=strsplit(line1);
        compare1=strcmp(arreglo1(1),words);
[n,words,typesWords,countsWords]=countWords(n,compare1,words,typesWords,countsWords,arreglo1);        
        
        arreglo2=strsplit(line2);
        compare2=strcmp(arreglo2(1),words);
[n,words,typesWords,countsWords]=countWords(n,compare2,words,typesWords,countsWords,arreglo2);        

    elseif(line1==-1&&line2!=-1)%There is a new sentence
        
        arreglo2=strsplit(line2);
        compare2=strcmp(arreglo2(1),words);
[n,words,typesWords,countsWords]=countWords(n,compare2,words,typesWords,countsWords,arreglo2);        
    
    elseif(line1!=-1&&line2==-1)%Thats the end of a sentence
   
        arreglo1=strsplit(line1);
        compare1=strcmp(arreglo1(1),words);
[n,words,typesWords,countsWords]=countWords(n,compare1,words,typesWords,countsWords,arreglo1);        
endif 



% I take two lines because every each sentence there is a blank space and that would yield -1
line1=fgetl(data);
line2=fgetl(data);

endwhile

function[n,words,typesWords,countsWords]=countWords(n,compare,words,typesWords,countsWords,arreglo)

d=0;

if(any(compare)) %Ya existe dicha palabra en el grupo
		    d=find(compare);%finds the index where the word is stored
                    countsWords(d)=countsWords(d)+1;

        else

	  words(n)=arreglo(1);
          typesWords(n)=arreglo(2);
          countsWords(n,1)=1;
n++;

endif


endfunction

endfunction
