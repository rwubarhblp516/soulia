# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "D:/github/my_product/soulia/windows/out/build/x64-Debug/_deps/nuget-src"
  "D:/github/my_product/soulia/windows/out/build/x64-Debug/_deps/nuget-build"
  "D:/github/my_product/soulia/windows/out/build/x64-Debug/_deps/nuget-subbuild/nuget-populate-prefix"
  "D:/github/my_product/soulia/windows/out/build/x64-Debug/_deps/nuget-subbuild/nuget-populate-prefix/tmp"
  "D:/github/my_product/soulia/windows/out/build/x64-Debug/_deps/nuget-subbuild/nuget-populate-prefix/src/nuget-populate-stamp"
  "D:/github/my_product/soulia/windows/out/build/x64-Debug/_deps/nuget-subbuild/nuget-populate-prefix/src"
  "D:/github/my_product/soulia/windows/out/build/x64-Debug/_deps/nuget-subbuild/nuget-populate-prefix/src/nuget-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "D:/github/my_product/soulia/windows/out/build/x64-Debug/_deps/nuget-subbuild/nuget-populate-prefix/src/nuget-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "D:/github/my_product/soulia/windows/out/build/x64-Debug/_deps/nuget-subbuild/nuget-populate-prefix/src/nuget-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
