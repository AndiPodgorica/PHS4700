function estAInterieurSphere=estAInterieurSphere(r,direction)
if dot(r,direction)<0
    estAInterieurSphere=true;
else
    estAInterieurSphere=false;
end
end