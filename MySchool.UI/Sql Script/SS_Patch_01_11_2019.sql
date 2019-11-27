create procedure stpGetYearForDropDown
as
begin
Select ID, [Year], YearDesc from Year
end