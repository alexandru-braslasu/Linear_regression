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
## @deftypefn {} {@var{retval} =} parse_csv_file (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Alexandru Braslasu <Alexandru Braslasu@DESKTOP-ANP6DNN>
## Created: 2023-04-29

function  [Y, InitialMatrix] = parse_csv_file (file_path)
  aux = textread(file_path, "%s", "delimiter", ",");
  [n m] = size(aux);
  lin = 0;
  col = 0;
  for i = 14 : n
    ++col;
    if (mod(col - 1, 13) == 0)
      ++lin;
      col = 1;
    endif
    if (col == 1)
      y(lin) = aux(i, 1);
    else
      InitialMatrix(lin, col - 1) = aux(i, 1);
    endif
  endfor
  auxy = cellstr(y);
  m = length(auxy);
  for i = 1 : m
    Y(i) = str2num(char(auxy(i)));
  endfor
endfunction
