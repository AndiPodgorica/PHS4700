function [xi,yi,zi,faces]=remplirDonnes(positionFinale,face)
for i=1:length(positionFinale)
    xi(i)=positionFinale{i}(1);
    yi(i)=positionFinale{i}(2);
    zi(i)=positionFinale{i}(3);
    faces(i)=face{i};
end
end