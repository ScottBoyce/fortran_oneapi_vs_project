module pauser
  !
  implicit none  
  contains
  !
  subroutine pause(msg)
    use, intrinsic:: iso_fortran_env, only: stdin=>input_unit, stdout=>output_unit
    character(*), intent(in), optional:: msg
    !
    if(present(msg)) then
        write(stdout,'(/a/)') msg
    else
        write(stdout,'(//a//)') 'Paused: Press Enter to Continue'
    end if
    !
    read(stdin, *) 
    !
  end subroutine
end module  