project(WIGXJPF)
cmake_minimum_required(VERSION 2.8)

set(CMAKE_BUILD_TYPE Release)
set(CMAKE_C_FLAGS "-Wall -Wextra -O3 -Wconversion -Wcast-qual")

set(quadmath_src 
  calc_float128.c
  c_wrap_float128.c)
set(quadmath_lib
  quadmath)

add_library(wigxjpf SHARED
  prime_factor.c
  calc.c
  trivial_zero.c
  c_wrap.c
  )
target_link_libraries(wigxjpf)

install(TARGETS wigxjpf
  RUNTIME DESTINATION lib
  LIBRARY DESTINATION lib)
