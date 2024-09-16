function [Nt,Ni]=calculerNtNi(entrerSphere,nint,next)
if entrerSphere==true
    Nt=nint;
    Ni=next;
else
    Nt=next;
    Ni=nint;
end
end