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
## @deftypefn {} {@var{retval} =} gradient_descent (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Alexandru Braslasu <Alexandru Braslasu@DESKTOP-ANP6DNN>
## Created: 2023-04-30

function  [Theta] = gradient_descent (FeatureMatrix, Y, n, m, alpha, iter)
  Theta = zeros(1, n + 1);
  k = 1;
  Theta = zeros(n + 1, 1);
  while (k <= iter)
    ++k;
    aux = FeatureMatrix * Theta(2 : n + 1);
    grad = ((aux' - Y) * FeatureMatrix) / m;
    for  i = 1 : n
      Theta(i + 1) = Theta(i + 1) - alpha * grad(i);
    endfor
  endwhile
endfunction
