function [ projectionMatrix ] = ComposeProjectionMatrix( projectionCenter, rotationMatrix, ...
    principlePoint, cameraConstant, skewness, scale )
% Compose the projection matrix of the input parameters.
% projectionCenter: 3D point in world coordinate system
% rotationMatrix: 3x3 matrix
% principlePoint: 2D point in image coordinate system
% cameraConstant: Camera constant
% skewness: Skweness of the y-axis
% scale: scale of the y-axis

%--------------------------------------------
%------------ Add your code here ------------
%--------------------------------------------
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% projection Matrix%
Identity = eye(3);
K = [[-cameraConstant -cameraConstant*skewness principlePoint(1,1)];[0 -cameraConstant*scale principlePoint(2,1)];[0 0 1]];

projectionMatrix = K * transpose(rotationMatrix)* [Identity projectionCenter];                   
end