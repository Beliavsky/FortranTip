implicit none ! GitHub FortranTip star.f90
character (len=20) :: s, nml_text
integer :: m(2), n
data m,n /3*5/
namelist /k/ m,n
print*,m,n ! 5 5 5
s = "2*6 9"
read (s,*) m,n
print*,m,n ! 6 6 9
nml_text = "&k m=2*7, n=3/"
read (nml_text,nml=k)
print*,m,n ! 7 7 3
end
