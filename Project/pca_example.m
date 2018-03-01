## Copyright (C) 2018 Kevin
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} pca_example (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Kevin <khannay@Bandit>
## Created: 2018-03-01

function [trend] = pca_example()

X=repmat(linspace(0,2*pi,100)',1,100); 
Y=sin(X)+0.5*randn(100);
[V,D]=eigs(cov(Y),1);
D
trend=Y*V;

figure
hold on
plot(Y)
plot(trend)


endfunction
