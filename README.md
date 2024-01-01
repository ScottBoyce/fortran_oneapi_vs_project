
# oneAPI Fortran Visual Studio Solution and Project Template

Simple setup for writing fortran files for compiling with Intel oneAPI `ifort` and `ifx` compilers.  
Visual Studio Solution file: [`ide/visual_studio/Solution.sln`](ide/visual_studio/Solution.sln)

To obtain repo and set it up for personal use:

```
git clone https://github.com/ScottBoyce/fortran_oneapi_vs_project.git  fortran_oneapi_vs_project

cd fortran_oneapi_vs_project

git switch null
git switch main
git remote remove origin
```

Note: you may want to rename `fortran_oneapi_vs_project` to whatever you want to call your project.



## Key Root Directory Names

| Directory         | Description                                                  |
| ----------------- | ------------------------------------------------------------ |
| bin               | Location for 64-bit compiled executable binaries             |
| .util             | Bash scripts for cleaning the repository (`cleanRepo.sh`)    |
| icon              | Location of icon file for final executable                   |
| ide               | Integrated development environment (ide) files to assist with compiling. |
| ide/visual_studio | Visual Studio solution (`.sln`) and project files (`.vcxproj` and `.vfproj`) <br />set up for the Intel oneAPI Fortran compilers. |
| img               | Images used in the `.md` files.                              |
| lib               | Directory used by Visual Studio for intermediate library files. |
| obj               | Git version control is set to keep this directory empty, but it is used for<br />intermediate object files during compilation (e.g. `.obj`, `.o`, and `.mod`). |
| src               | Fortran source code folder                                   |
| test              | Test related Fortran code, associated input files and test output location |
| test/input        | Test related input files                                     |
| test/output       | Test related output location                                 |
| test/src          | Fortran main program and test source codes                   |

It is best to rename `Solution.sln` and `Project.vfproj` in Visual Studio by right clicking and selecting `Rename` (or press `F2`).
