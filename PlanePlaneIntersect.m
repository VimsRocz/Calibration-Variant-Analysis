function [ line, covMatrix ] = PlanePlaneIntersect( planeA, covA, planeB, covB )
% Intersects two planes.
% planeA, planeB: Homogeneous representation of 3D planes.
% covA, covB: Covariance matrices corresponding to the planes
% line: 3D line representation via Plücker coordinates.
% covMatrix: Covariance matrix corresponding to the line

%--------------------------------------------
%------------ Add your code here ------------
%--------------------------------------------
 % Normal of plane A and plane B
Omega_H1 = planeA(1:3,1);
Omega_H2 = planeB(1:3,1); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Form the dual of Phi(plane A) and Phi(plane B)

% Identity_Matrix matrix of normal vector of plane B
Identity_Matrix = eye(numel(Omega_H2(:,1)));

% skew matrices of homogeneous part of omega of plane A and plane B
Skew_Matrix_1 = [0 -Omega_H1(3) Omega_H1(2) ; Omega_H1(3) 0 -Omega_H1(1) ; -Omega_H1(2) Omega_H1(1) 0 ];
Skew_Matrix_2 = [0 -Omega_H2(3) Omega_H2(2) ; Omega_H2(3) 0 -Omega_H2(1) ; -Omega_H2(2) Omega_H2(1) 0 ];

% dual of Phi(omega1) and Phi(omega2)  mention in the slide eq
Dual_1 =[[Skew_Matrix_1 [0;0;0]];[planeA(4,1)*Identity_Matrix -Omega_H1]];
Dual_2 =[[Skew_Matrix_2 [0;0;0]];[planeB(4,1)*Identity_Matrix -Omega_H2]];

% Computing the 3D line representation via Pl?cker coordinates
line = - Dual_2 *planeA(:,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Covariance matrix corresponding to the line
covMatrix = Dual_1*covB*transpose(Dual_1) + Dual_2*covA*transpose(Dual_2);                     
end