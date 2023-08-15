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
## @deftypefn {} {@var{retval} =} normal_equation (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Alexandru Braslasu <Alexandru Braslasu@DESKTOP-ANP6DNN>
## Created: 2023-04-30

function [Theta] = normal_equation (FeaturesMatrix, Y, tol, iter)
  [p q] = size(FeaturesMatrix);
  A = FeaturesMatrix' * FeaturesMatrix;
  ok = 1;
  for i = 1 : q
    sub = A(1 : i, 1 : i);
    if (det(sub) < 0)
      ok = 0;
    endif
  endfor
  Theta = zeros(q + 1, 1);
  if (ok)
    for i = 1 : q;
      sum = 0;
      for j = 1 : p
        sum = sum + FeaturesMatrix(j, i) * Y(j);
      endfor
      r(1, i) = sum;
    endfor
    v(1 : q, 1) = r(1, 1 : q);
    tolsq = tol * tol;
    k = 1;
    R(1 : q, 1) = r(mod(k - 1, 2) + 1, 1 : q);
    while (k <= iter && R' * R > tolsq)
      R(1 : q, 1) = r(mod(k - 1, 2) + 1, 1 : q);
      t = (R' * R) / (v' * A * v);
      Theta(2 : q + 1) = Theta(2 : q + 1) + t * v(1 : q, 1);
      C = t * A * v;
      r(mod(k, 2) + 1, 1 : q) = R(1 : q) - C(1 : q);
      Q(1 : q, 1) = r(mod(k, 2) + 1, 1 : q);
      s = (Q' * Q) / (R' * R);
      v = Q + s * v;
      ++k;
    endwhile
  endif
endfunction
