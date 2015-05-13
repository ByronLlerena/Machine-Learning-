function[counts,words,types,n]=emission(freq)

aux=0;
n=1;
counts=0;
words={};
types={};
isWordTag=1;
line=0;
arreglo=0;

fseek(freq,0,-1);

while(isWordTag>0)

  line=fgetl(freq);
arreglo=strsplit(line);
  
    if(strcmp(arreglo(1,2),"WORDTAG"))
      counts(n,1)=str2num(arreglo{1});
      types{n}=arreglo{3};
      words{n}=arreglo{4};
      n++;
  
    else
    
      isWordTag=0;

     endif

  
endwhile

end 
