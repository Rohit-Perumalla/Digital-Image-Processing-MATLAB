%% Experiment 1
% Matrix Manipulation and Matrix Functions

clc;
clear;
close all;

%% Matrix Manipulation

% Create a 3x3 matrix
A = [1, 2, 3;
     4, 5, 6;
     7, 8, 9];

% Accessing an individual element
% Gets the element at row 2, column 3
element = A(2, 3);

% Display the selected element
disp('Element at row 2, column 3:');
disp(element);

%% Accessing Rows and Columns

% Access the second row
row2 = A(2, :);

% Access the third column
col3 = A(:, 3);

disp('Second row:');
disp(row2);

disp('Third column:');
disp(col3);

%% Extracting Submatrix

% Extract a 2x2 submatrix
subA = A(1:2, 2:3);

disp('2x2 Submatrix:');
disp(subA);

%% Appending Rows and Columns

% Append a row vertically
B = [A; 10, 11, 12];

% Append a column horizontally
C = [A, [13; 14; 15]];

disp('Matrix after appending a row:');
disp(B);

disp('Matrix after appending a column:');
disp(C);

%% Matrix Functions

% Create a 2x2 matrix
A = [1, 2;
     3, 4];

% Calculate determinant
det_A = det(A);

% Calculate inverse
inv_A = inv(A);

% Calculate eigenvalues and eigenvectors
[V, D] = eig(A);

% Calculate Singular Value Decomposition
[U, S, V_svd] = svd(A);

% Calculate rank
rank_A = rank(A);

% Calculate trace
trace_A = trace(A);

% Calculate transpose
t = A';

disp('Determinant:');
disp(det_A);

disp('Inverse:');
disp(inv_A);

disp('Eigenvectors:');
disp(V);

disp('Eigenvalues:');
disp(D);

disp('SVD - U:');
disp(U);

disp('SVD - S:');
disp(S);

disp('SVD - V:');
disp(V_svd);

disp('Rank:');
disp(rank_A);

disp('Trace:');
disp(trace_A);

disp('Transpose:');
disp(t);

%% Creating Matrices

% Create a matrix using direct assignment
A = [1, 2, 3;
     4, 5, 6;
     7, 8, 9];

% Create matrices using MATLAB functions
B = zeros(3);      % 3x3 matrix containing zeros
C = ones(2, 4);    % 2x4 matrix containing ones
D = eye(3);        % 3x3 identity matrix
E = rand(2, 3);    % 2x3 matrix of random values between 0 and 1
F = randn(3, 2);   % 3x2 matrix of normally distributed random values

disp('Matrix using direct assignment:');
disp(A);

disp('Zeros matrix:');
disp(B);

disp('Ones matrix:');
disp(C);

disp('Identity matrix:');
disp(D);

disp('Random matrix:');
disp(E);

disp('Normally distributed random matrix:');
disp(F);

%% Colon Operator for Creating Vectors

% Create a vector from 1 to 5
x = 1:5;

% Create a vector from 1 to 3 with an increment of 0.5
y = 1:0.5:3;

disp('Vector x:');
disp(x);

disp('Vector y:');
disp(y);
