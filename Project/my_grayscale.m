## Copyright (C) 2018 Kevin Hannay
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
## @deftypefn {Function File} {@var{retval} =} my_grayscale (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Kevin Hannay <khannay@walty-ws>
## Created: 2018-03-17

function R1= my_grayscale(filename)

R=imread(filename);
R=double(R);
%If this is rgb image then grayscale it
if (length(size(R))==3)
  redchannel=R(:,:,1);
  greenchannel=R(:,:,2);
  bluechannel=R(:,:,3);
  R1=.299*redchannel + .587*greenchannel + .114*bluechannel;
 else
  R1=R;
 end

endfunction
