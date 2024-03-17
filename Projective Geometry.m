clear all; close all; dbstop error;

% Import parameters
[pointsPlaneA, pointsPlaneB, pointsPlaneC, projectionCenter, ...
    rotationMatrix, principlePoint, cameraConstant, skewness, scale, ...
    imagePoints, covPointA, covPointB, covPointC] = ImportParameters();

% Reconstruct planes
[planeA, covA] = ReconPlane(pointsPlaneA);
[planeB, covB] = ReconPlane(pointsPlaneB);
[planeC, covC] = ReconPlane(pointsPlaneC);

% Intersect first two planes
[line, covLine] = PlanePlaneIntersect(planeA, covA, planeB, covB);

% Intersect resulting line with third plane
[point, covPoint] = PlaneLineIntersect(planeC, covC, line, covLine);

% Compose the projection matrix
projectionMatrix = ComposeProjectionMatrix(projectionCenter, rotationMatrix, ...
    principlePoint, cameraConstant, skewness, scale);

% Decide to which image point the object point probably coincides to

%--------------------------------------------
%------------ Add your code here ------------
%--------------------------------------------
Project_Point_1 = projectionMatrix*point;
Jacobian =(1/Project_Point_1(3,1))*[[1 0 -Project_Point_1(1,1)/Project_Point_1(3,1)];[0 1 -Project_Point_1(2,1)/Project_Point_1(3,1)];[0 0 0]];
projectedPoint = [Project_Point_1(1,1)/Project_Point_1(3,1) ; Project_Point_1(2,1)/Project_Point_1(3,1)];

Covariance_Projected_1 = projectionMatrix*covPoint*transpose(projectionMatrix);
covProjected = Jacobian*Covariance_Projected_1*transpose(Jacobian);
%--------------------------------------------

% Draw error ellipses
figure()
hold on
PlotErrorEllipse(projectedPoint, covProjected);
PlotErrorEllipse(imagePoints(:,1), covPointA);
PlotErrorEllipse(imagePoints(:,2), covPointB);
PlotErrorEllipse(imagePoints(:,3), covPointC);
hold off