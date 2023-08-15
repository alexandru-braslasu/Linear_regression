## Copyright (C) 2023 Alexandru Braslasu
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} prepare_for_regression (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Alexandru Braslasu <Alexandru Braslasu@DESKTOP-ANP6DNN>
## Created: 2023-04-29

function [FeatureMatrix] = prepare_for_regression (InitialMatrix)
  [m n] = size(InitialMatrix);
  mat = cellstr(InitialMatrix);
  for i = 1 : m
    k = 0;
    for j = 1 : n
      ++k;
      if (strcmp(char(mat(i, j)), "yes"))
        FeatureMatrix(i, k) = 1;
      elseif (strcmp(char(mat(i, j)), "no"))
        FeatureMatrix(i, k) = 0;
      elseif (strcmp(char(mat(i, j)), "semi-furnished"))
        FeatureMatrix(i, k) = 1;
        ++k;
        FeatureMatrix(i, k) = 0;
      elseif (strcmp(char(mat(i, j)), "unfurnished"))
        FeatureMatrix(i, k) = 0;
        ++k;
        FeatureMatrix(i, k) = 1;
      elseif (strcmp(char(mat(i, j)), "furnished"))
        FeatureMatrix(i, k) = 0;
        ++k;
        FeatureMatrix(i, k) = 0;
      else
        FeatureMatrix(i, k) = str2num(char(mat(i, j)));
      endif
    endfor
  endfor
endfunction
