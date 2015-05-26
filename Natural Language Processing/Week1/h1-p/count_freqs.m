
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
aux1="**";
aux0="*";
fseek(data,0,-1);
compare1=0;

n=1;
contador=1;


%I take the forst two lines

line1=fgetl(data)


while(line1!=-1)


          arreglo1=strsplit(line1," ");
          compare1=strcmp(arreglo1(1),words);

          d=0;

          if(any(compare1)) %Ya existe dicha palabra en el grupo
              d=find(compare1);%finds the index where the word is stored
              countsWords(d)=countsWords(d)+1;

           else

          words(n)=arreglo1(1);
          typesWords(n)=arreglo1(2);
          countsWords(n,1)=1;
          n++;

          endif

	  line1=fgetl(data)


	    if(strcmp(line1,""))
            printf("\n Espacio vacio en %d\n\n",contador);
	    line1=fgetl(data)
	    blankspaces(end+1)=contador;
            endif

	    contador++;


endwhile

endfunction



