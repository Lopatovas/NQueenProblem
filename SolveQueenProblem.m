function SolveQueenProblem()
clear; clc;
n=8;
boardMatrix = zeros(n, n);
SolveQueenProblemRecursively(boardMatrix, 1, n);
end

function out = SolveQueenProblemRecursively(boardMatrix, col, n)
    if col > n
        out = true;
        showGraph(boardMatrix, n);
        return;
    end
    for i = 1:n
        if isSafe(boardMatrix, i, col, n)
            boardMatrix(i, col) = 1;
            if SolveQueenProblemRecursively(boardMatrix, col + 1, n)
                out = true;
                return;
            end
            boardMatrix(i, col) = 0;
        end
    end
    out = false;
end

function out = isSafe(boardMatrix, row, col, n)
%For horizontal to the left%
for i = 1:col
    if boardMatrix(row, i) == 1
        out = false;
        return;
    end
end
%For upper diagonal
i = row;
j = col;
while j ~= 0 && i ~= 0
    if boardMatrix(i, j) == 1
        out = false;
        return;
    end
    j = j - 1;
    i = i - 1;
end
%For lower diagonal%
i = row;
j = col;
while j ~= 0 && i <= n
    if boardMatrix(i, j) == 1
        out = false;
        return;
    end
    i = i + 1;
    j = j - 1;
end
out = true;
end

function showGraph(boardMatrix, n)
board=zeros(n)+0.6;
for i=1:n
    for j=1:n
    if rem(i+j,2)==0
    board(i,j)=0.9;
    end
    end
end
imshow(board,'InitialMagnification',5000);
axis equal;
axis on;
for col=1:n
    for row=1:n
    if boardMatrix(row,col)==1;
        text(row,col,char(9819),...
        'HorizontalAlignment','center',...
        'FontSize',30);
    end
    end
end
end