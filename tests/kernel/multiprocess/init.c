//
// Copyright 2016 Jeff Bush
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#define ALLOC_SIZE 0x40000

extern int __syscall(int n, int arg0, int arg1, int arg2, int arg3, int arg4);

void exec(const char *path)
{
    __syscall(3, (int) path, 0, 0, 0, 0);
}

// Launch multiple instances of the memory tester in parallel. On success, this
// should print "+++++"

int main()
{
    int i;

    for (i = 0; i < 5; i++)
        exec("memtest.elf");
}
