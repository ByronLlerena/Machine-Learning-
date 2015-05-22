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
