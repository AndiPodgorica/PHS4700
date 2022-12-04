function [ur]=calculerReflexion(ui,pointContact)
i=pointContact/norm(pointContact
ur=ui-2*dot(dot(ui,i),i);
% theta=asin(dot(ui,k));
end