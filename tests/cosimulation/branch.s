#
# Copyright 2011-2015 Jeff Bush
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

.include "../asm_macros.inc"


#
# Test all branch types
#


                .globl _start
_start:
                move s0, 1
                move s1, 0
                move s2, -1

# Unconditional Branch
test0:          b 1f
                move s10, 1
                b 2f
1:              move s10, 2

# bz, taken
2:              bz s1, 1f
                move s10, 3
                b 2f
1:              move s10, 4

# bz, not taken
2:              bz s0, 1f
                move s10, 5
                b 2f
1:              move s10, 6


# bnz, taken
2:              bnz s0, 1f
                move s10, 7
                b 2f
1:              move s10, 8

# bnz, not taken
2:              bnz s1, 1f
                move s10, 9
                b 2f
1:              move s10, 10

# Call
2:              call calltest1
calltest1:      move s10, 23

# Call register
                lea s0, calltest2
                call s0
calltest2:      move s10, 24

                halt_current_thread

