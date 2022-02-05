program simulate_pi
use iso_fortran_env, only: compiler_version,compiler_options
implicit none
integer, parameter :: n = 10**8
integer :: pi_count, i, itime(8), jt1, jt2, itick
real    :: x, y, t1, t2
character (len=100) :: exec, date, time
! get initial times for cpu_time and system_clock
call cpu_time(t1)
call system_clock(count=jt1,count_rate=itick)
pi_count = 0
call random_seed()
do i = 1, n
 call random_number(x)
 call random_number(y)
 if (x**2 + y**2 < 1.0) pi_count = pi_count + 1
end do
print*,"pi =",pi_count*4.0/n
! get final times for cpu_time and system_clock
call cpu_time(t2) ; call system_clock(jt2)
call get_command_argument(0,exec)
print "(a)", "executable: " // trim(exec)
print "(a)", "compiler: " // compiler_version()
print "(a)", "options: " // compiler_options()
call date_and_time(date=date,time=time,values=itime)
print "(3(a,1x))", "time:", trim(date), trim(time)
print "('time: ',i4.4,2('-',i2.2),1x,i2.2,2(':',i2.2))", &
  itime([1,2,3,5,6,7]) ! custom formatting
print "('cpu time (s): ',f0.2)",t2-t1
print "('wall time (s): ',f0.2)",(jt2-jt1)/real(itick)
end program simulate_pi
! Windows output of ifort -O3 -stand:f18 xpi.f90 && xpi.exe:
! pi =   3.141639    
! executable: xpi.exe
! compiler: Intel(R) Fortran Intel(R) 64 Compiler Classic \
! for applications running on Intel(R) 64, Version 2021.5.0 \
! Build 20211109_000000
! options: /O3 /stand:f18
! time: 20220205 081020.498
! time: 2022-02-05 08:10:20
! cpu time (s): 2.16
! wall time (s): 2.15