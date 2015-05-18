function [newCounts,newWords]= replaceWords(counts,words)

comparisson=0;
indexes=0;
newWords=words;

comparisson=counts<5;
indexes=find(comparisson);
newWords(indexes)="_RARE_";
newCounts=0;



end
