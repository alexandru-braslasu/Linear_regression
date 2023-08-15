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
## @deftypefn {} {@var{retval} =} parse_data_set_file (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Alexandru Braslasu <Alexandru Braslasu@DESKTOP-ANP6DNN>
## Created: 2023-04-21

function [Y, InitialMatrix] = parse_data_set_file (file_path)
  f = fopen(file_path, "r");
  aux = textscan(f, "%s");
  mat = cell2mat(aux);
  matr = cellstr(aux);
  m = str2num(char(matr(1, 1)));
  n = str2num(char(matr(2, 1)));
  k = 2;
  for i = 1 : m
    ++k;
    Y(i) = str2num(char(matr(k, 1)));
    for j = 1 : n
      ++k;
      InitialMatrix(i, j) = mat(k, 1);
    endfor
  endfor
endfunction
