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
## @deftypefn {} {@var{retval} =} run_test (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Alexandru Braslasu <Alexandru Braslasu@DESKTOP-ANP6DNN>
## Created: 2023-04-29

function run_test ()
    fout = fopen("out", "w+");
    [Y InitialMatrix] = parse_csv_file("Housing.csv");
    [FeatureMatrix] = prepare_for_regression(InitialMatrix);
    alpha = (1e-4)^4;
    [m n] = size(FeatureMatrix);
    iter = 125;

    [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter);

    for i = 1 : length(Theta)
        fprintf(fout, "%e\n", Theta(i));
    endfor

    fclose(fout);
endfunction
