function [homogeneousPlane, covMatrix] = ReconPlane( listOfPoints )
% Reconstruct the plane and its covariance matrix from the sampled points
% listOfPoints: Matrix containing a 3D point in each column
% homogeneousPlane: Plane in homogenous representation
% covMatrix: Covariance matrix corresponding to the plane

%--------------------------------------------
%------------ Add your code here ------------
%--------------------------------------------
% Number of points in the listOfPoints sets are as mention we are counting
Number_of_points = numel(listOfPoints(1,:));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate the center of gravity
X_center_of_gravity(1,:) = (1/Number_of_points)* sum(listOfPoints(1,:));
X_center_of_gravity(2,:) = (1/Number_of_points)* sum(listOfPoints(2,:));
X_center_of_gravity(3,:) = (1/Number_of_points)* sum(listOfPoints(3,:));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The matrix of the second central moments Moment 
Sum_X_2=0;Sum_Y_2 =0; Sum_Z_2=0; Sum_XY=0;Sum_YZ=0; Sum_ZX=0;
    for i=1:Number_of_points
        Sum_X_2 = Sum_X_2 + (listOfPoints(1,i)-X_center_of_gravity(1,:))^2;
        Sum_Y_2 = Sum_Y_2 + (listOfPoints(2,i)-X_center_of_gravity(2,:))^2;
        Sum_Z_2 = Sum_Z_2 + (listOfPoints(3,i)-X_center_of_gravity(3,:))^2;
        Sum_XY = Sum_XY + (listOfPoints(1,i)-X_center_of_gravity(1,:))*(listOfPoints(2,i)-X_center_of_gravity(2,:));
        Sum_YZ = Sum_YZ + (listOfPoints(2,i)-X_center_of_gravity(2,:))*(listOfPoints(3,i)-X_center_of_gravity(3,:));
        Sum_ZX = Sum_ZX + (listOfPoints(1,i)-X_center_of_gravity(1,:))*(listOfPoints(3,i)-X_center_of_gravity(3,:));
        
        
    end
    Moment = [[Sum_X_2 Sum_XY Sum_ZX];[Sum_XY Sum_Y_2 Sum_YZ];[Sum_ZX Sum_YZ Sum_Z_2]];
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eigenvalue decomposition of Moment ( eig1<eig2<eig3) for the probality
% distribution of the random variable
%second central moment provides info about the covariance and incovariance
%matric with list of points

[Eigen_vectors, Eigen_values] = eig(Moment);
D = diag(Eigen_values);
Eigenvectors_t = transpose(Eigen_vectors);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% omegah and omega0 there are 2 parts of the plane hence we can represents
% in euclidien with x,y  
Omega_H =(-1)* Eigen_vectors(:,1);
Omega_O = transpose(Omega_H)*X_center_of_gravity;
homogeneousPlane = [Omega_H; Omega_O];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% H defined by U1, U2, U3  we can obtain 
H= [[Eigenvectors_t -Eigenvectors_t*X_center_of_gravity];[0 0 0 1]];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compute Omega given Omega' and s02
omega_prime = [0 0 1 0];
s02 = Eigen_values(1,1)/(Number_of_points-3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compute the covariance matrix of plane
sum_omega_prime = s02 * [[1/D(3) 0 0 0];[0 1/D(2) 0 0];[0 0 0 0];[0 0 0 1/Number_of_points]];
covMatrix =(inv(H)).'* sum_omega_prime*(inv(H));

end