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
## @deftypefn {} {@var{retval} =} run_csv (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Alexandru Braslasu <Alexandru Braslasu@DESKTOP-ANP6DNN>
## Created: 2023-05-01

function run_csv ()
  fout = fopen("out", "w+");
  [Y InitialMatrix] = parse_csv_file("Housing.csv");
  [FeatureMatrix] = prepare_for_regression(InitialMatrix);
  tol = 1e-18;
  [m n] = size(FeatureMatrix);
  max_iter = 1250;

  [Theta] = normal_equation(FeatureMatrix, Y, tol, max_iter);

  for i = 1 : length(Theta)
      fprintf(fout, "%e\n", Theta(i));
  endfor

  fclose(fout);
endfunction
