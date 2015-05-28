
function[countsWords, words,typesWords,counts1Gram,types1Gram,counts2Gram,types2Gram,counts3Gram,type3Gram]=count_freqs(data);

blankspaces=0;
countsWords=0;
words={};
typesWords={};
counts1Gram=0;
types1Gram={};
counts2Gram=0;
types2Gram={};
counts3Gram=0;
types3Gram={};
line1=0;
arreglo1=0;
aux0="**";
aux1="*";
fseek(data,0,-1);
compare1=0;
compare2=0;

gramsCounter=0;
firstWord="";
secondWord="";
thirdWord="";


n=1;
contador=1;


%I take the forst two lines

line1=fgetl(data);
firstWord="**";
secondWord="*";  

  while(line1!=-1)

  arreglo1=strsplit(line1," ");
  
   if(length(arreglo1)>0)

                 % thirdWord=arreglo1(1);
                 % countNgrams(firstWord,secondWord,thirdWord);
                 % firstWord=secondWord;
                 % secondWord=arreglo1(1);  

	          compare1=strcmp(arreglo1(1),words);

                  d=0;

                   if(any(compare1)) %Ya existe dicha palabra en el grupo

	                    d=find(compare1);%finds the index where the word is stored
                
	                    compare2=strcmp(typesWords(d),arreglo1(2));% Compare if the wrod was stored as a Word or as I-GENE

	         	     if(compare2)
		              %The word was already stored either as a WORD or I-GENE
		              countsWords(d)=countsWords(d)+1;%Just sum the counter  
                              else
		              words(n)=arreglo1(1);
                              typesWords(n)=arreglo1(2);
                              countsWords(n,1)=1;
                              n++; 
		       
                              endif

		    else

                               words(n)=arreglo1(1);
                               typesWords(n)=arreglo1(2);
                               countsWords(n,1)=1;
                               n++;

                    endif
                 
		    line1=fgetl(data);
                    
  else
     %That was a blank space so I need to get a new line 
 % thirdWord="STOP";
 % countNgrams(firstWord,secondWord,thirdWord);
 % firstWord="**";
 % secondWord="*";
 printf("Espacio NUevo");

 line1=fgetl(data);
 %blankspaces(end+1)=contador;
 %contador++;

  endif

 
  
  
 
 
endwhile

%COUNT UNIGRAMS
%uniGENE=sum(strcmp(typesWords,"I-GENE"));
%uniWORDS=sum((typesWords,"O"));

endfunction



